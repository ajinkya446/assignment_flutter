import 'package:flutter/material.dart';

class AppTextStyle {
  static TextStyle textStyleRegular(Color color, {double size = 14, String? family}) {
    return TextStyle(
      fontFamily: family ?? "OpenSans",
      color: color,
      fontSize: size,
      fontWeight: family != null ? FontWeight.w700 : FontWeight.normal,
    );
  }

  static TextStyle textStyleBold(Color? color, {double? size = 14, FontWeight? fontWeight}) {
    return TextStyle(
      fontFamily: "OpenSans",
      color: color,
      fontSize: size,
      fontWeight: fontWeight ?? FontWeight.w700,
    );
  }
}
