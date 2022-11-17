import 'package:form_field_validator/form_field_validator.dart';

import '../constants.dart';
import '../helper_methods.dart';

List repeatList = ['daily', 'weekly', 'monthly', 'never'];

class AppUtils {
  /// Email Validation applying done here
  static bool validateEmail(String text) {
    final emailValidate = EmailValidator(errorText: MessageConstants.emailErrorText);
    if (emailValidate.isValid(text)) {
      return true;
    } else {
      return false;
    }
  }

  /// Checking validation for mobile numbers.
  static bool checkValidPhoneNumber(String text) {
    String pattern = r'^(?:[+0]9)?[0-9]{10}$';
    RegExp exp = RegExp(pattern);
    if (exp.hasMatch(text)) {
      return true;
    } else {
      return false;
    }
  }

  static bool checkTextValidations(String text) {
    String pattern = r'[0-9]';
    RegExp exp = RegExp(pattern);
    if (exp.hasMatch(text)) {
      return false;
    } else {
      return true;
    }
  }

  /// Password Validation done here
  static bool validatePassword(String text) {
    final passValidate = Validation().passwordValidator;
    if (passValidate.isValid(text)) {
      return true;
    } else {
      return false;
    }
  }
}
