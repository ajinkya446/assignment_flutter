import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../view/home.dart';

class UserService {
  static TextEditingController _codeController = TextEditingController();

  static Future loginWithMobile(final mobileNumber, BuildContext context) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    _auth
        .verifyPhoneNumber(
        phoneNumber: "+91 $mobileNumber",
        timeout: const Duration(seconds: 15),
        verificationCompleted: (AuthCredential authCredential) async {
//code for signing in
          Navigator.of(context).pop();
          final result = await _auth.signInWithCredential(authCredential);
          final user = result.user;
          if (user != null) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        HomeScreen(
                            value: user
                        )));
          } else {
            print("Error");
          }
        },
        verificationFailed: (FirebaseAuthException error) {
          print(error.message);
        },
        codeSent: (String verificationId, int? forceResendingToken) {
          //show dialog to take input from the user
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) =>
                  AlertDialog(
                    title: const Text("Enter SMS Code"),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[TextField(controller: _codeController)],
                    ),
                    actions: <Widget>[
                      ElevatedButton(
                        child: const Text("Done"),
                        onPressed: () {
                          FirebaseAuth auth = FirebaseAuth.instance;

                          final smsCode = _codeController.text.trim();

                          final _credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
                          auth.signInWithCredential(_credential).then((result) {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(value: result.user)));
                          }).catchError((e) {
                            print(e);
                          });
                        },
                      )
                    ],
                  ));
        },
        codeAutoRetrievalTimeout: (String verificationId) {})
        .catchError((e) {
      print(e);
    });
  }
}
