import 'package:assignment_flutter/commons/helper_methods.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../services/user_service.dart';

class LoginController extends ControllerMVC {
  ValueNotifier<bool> isRememberMeSelect = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
  }

  Future checkUserLogin(String number, BuildContext context) async {
    final statusResult = await InternetConnectionHelper.checkInternetConnection();
    if (statusResult == true) {
      bool status = await UserService.loginWithMobile(number, context);
      return status;
    } else {
      HelperMethods.showToast('No Internet Connection');
      return false;
    }
  }
}
