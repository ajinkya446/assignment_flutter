import 'package:assignment_flutter/commons/widgets/app_text_style.dart';
import 'package:assignment_flutter/commons/widgets/textWidget_UI.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ButtonWidget {
  static button(BuildContext context, String title, EdgeInsetsGeometry? margin,
      {double? fontSize = 14, double? height, double? width, required Function(String) onPressed, Color? backgroundColor, TextAlign? align}) {
    return Container(
      height: height ?? 55,
      width: width ?? MediaQuery.of(context).size.width,
      margin: margin ?? const EdgeInsets.only(bottom: 20, left: 8, right: 8, top: 25),
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            backgroundColor: backgroundColor ?? AppColors.buttonOrangeColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          onPressed: () => onPressed(title),
          child: TextWidgetUI().text(
            title,
            style: AppTextStyle.textStyleBold(Colors.white, size: fontSize),
            textAlign: align ?? TextAlign.center,
          )),
    );
  }
}
