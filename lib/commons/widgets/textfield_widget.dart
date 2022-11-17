import 'package:flutter/material.dart';

import '../constants.dart';
import '../utils/app_utils.dart';

class TextFieldWidget extends StatefulWidget {
  final String title;
  final Function(String)? onChanged;
  final String? operation;

  // final String operation;
  final TextEditingController? controller;
  final bool obscureText;
  final Widget? suffixIcon;
  final Function(String?)? submitData;

  const TextFieldWidget({
    Key? key,
    required this.title,
    this.onChanged,
    this.operation,
    this.suffixIcon,
    this.controller,
    this.submitData,
    this.obscureText = false,
  }) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) => widget.onChanged!.call(value),
      controller: widget.controller,
      obscureText: widget.obscureText,
      onFieldSubmitted: (submit) => widget.submitData!.call(submit),
      validator: (value) {
        if (value!.isEmpty) {
          return MessageConstants.validData;
        }
        if (widget.operation == 'phone') {
          bool status = AppUtils.checkValidPhoneNumber(widget.controller!.text);
          if (!status) {
            return MessageConstants.validContact;
          }
        } else {}
        // return '';
      },
      decoration: InputDecoration(
          isDense: true,
          suffixIcon: widget.suffixIcon,
          hintText: widget.title,
          hintStyle: const TextStyle(fontSize: 14),
          hintTextDirection: TextDirection.ltr,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.circular(5),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Colors.red),
            borderRadius: BorderRadius.circular(5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Colors.red),
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Colors.green),
            borderRadius: BorderRadius.circular(5),
          )),
    );
  }
}
