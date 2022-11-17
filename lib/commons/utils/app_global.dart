import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppGlobalValues {
  static ValueNotifier<String> appVersion = ValueNotifier("");
  static ValueNotifier<bool> isLogoStatus = ValueNotifier(false);
  static ValueNotifier<bool> isValidatePhone = ValueNotifier(false);
  static ValueNotifier<bool> isPasswordVisible = ValueNotifier(true);
}
