import 'package:flutter/material.dart';

import '../constants.dart';
import 'app_text_style.dart';

class TextWidgetUI {
  Widget text(String message, {TextStyle? style, TextAlign? textAlign, Color? color}) {
    return Text(
      message,
      style: style ?? AppTextStyle.textStyleRegular(color ?? AppColors.blackColor, size: 16),
      textAlign: textAlign ?? TextAlign.center,
    );
  }
}
