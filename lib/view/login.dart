import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../commons/constants.dart';
import '../commons/helper_methods.dart';
import '../commons/utils/app_global.dart';
import '../commons/utils/app_utils.dart';
import '../commons/widgets/app_text_style.dart';
import '../commons/widgets/button_widget.dart';
import '../commons/widgets/textWidget_UI.dart';
import '../commons/widgets/textfield_widget.dart';
import '../controller/login_controller.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  LoginState createState() => LoginState();
}

class LoginState extends StateMVC<Login> {
  late GlobalKey<FormState> _formKey;
  late TextEditingController phoneController;
  late LoginController _loginController;
  bool? rememberMe;

  LoginState() : super(LoginController()) {
    _loginController = controller as LoginController;
  }

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    phoneController = TextEditingController();
    _loginController.initState();
  }

  @override
  void dispose() {
    _loginController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Form(key: _formKey, child: _buildWidget()),
        ),
        bottomNavigationBar: SafeArea(
          bottom: true,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
            child: ValueListenableBuilder(
              builder: (BuildContext context, versionValue, Widget? child) {
                return Text(
                  "${MessageConstants.versionConstants} $versionValue",
                  style: AppTextStyle.textStyleRegular(AppColors.blackColor, size: 16),
                  textAlign: TextAlign.center,
                );
              },
              valueListenable: AppGlobalValues.appVersion,
            ),
          ),
        ));
  }

  Widget _buildWidget() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 89),
          Container(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: Text(MessageConstants.signIn, style: AppTextStyle.textStyleBold(Colors.black, size: 20), textAlign: TextAlign.left),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(8, 30, 8, 0),
            child: TextWidgetUI().text(
              MessageConstants.phoneNumber,
              style: AppTextStyle.textStyleRegular(Colors.grey, size: 16),
              textAlign: TextAlign.left,
            ),
          ),
          ValueListenableBuilder(
              valueListenable: AppGlobalValues.isValidatePhone,
              builder: (ctx, bool status, child) {
                return Container(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 5),
                  child: TextFieldWidget(
                    suffixIcon: status
                        ? Icon(Icons.check, color: AppColors.buttonOrangeColor, size: 22)
                        : const Visibility(
                            visible: false,
                            child: Icon(Icons.remove_red_eye, size: 22),
                          ),
                    title: MessageConstants.enterEmail,
                    controller: phoneController,
                    operation: 'phone',
                    submitData: (value) {},
                    onChanged: (value) {
                      AppGlobalValues.isValidatePhone.value = AppUtils.checkValidPhoneNumber(phoneController.text);
                    },
                  ),
                );
              }),
          ButtonWidget.button(
            context,
            MessageConstants.signIn,
            const EdgeInsets.only(bottom: 20, left: 8, right: 8, top: 25),
            height: 60,
            fontSize: 17,
            onPressed: (title) async {
              if (title == MessageConstants.signIn) {
                HelperMethods.isLoginFrom = title;
                if (_formKey.currentState!.validate()) {
                  // HelperMethods.showLoadingDialog(context);
                  await _loginController.checkUserLogin(phoneController.text, context);
                } else {
                  phoneController.text = '';
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
