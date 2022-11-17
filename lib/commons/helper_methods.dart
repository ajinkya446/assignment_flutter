import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';

class InternetConnectionHelper {
  static Future<bool> checkInternetConnection() async {
    // var result;
    final result = await Connectivity().checkConnectivity();
    return result == ConnectivityResult.none
        ? false
        : result == ConnectivityResult.mobile
            ? true
            : result == ConnectivityResult.wifi
                ? true
                : false;
  }
}

class HelperMethods {
  static String isLoginFrom = '';

  static Color colorFromHex(String hexColor) {
    final hexCode = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }

  static void showToast(String title) {
    Fluttertoast.showToast(
      msg: title,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static void showLoadingDialog(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Alert'),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [CupertinoActivityIndicator(), Text('Please wait for a while...')],
        ),
        // actions: <CupertinoDialogAction>[
        //   CupertinoDialogAction(
        //     isDefaultAction: true,
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //     child: const Text('Cancel'),
        //   ),
        // ],
      ),
    );
  }
}

class Validation {
  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'password is required'),
    MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'passwords must have at least one special character')
  ]);
}
