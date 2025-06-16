import 'package:flutter/material.dart';

import '../../../../../core/uitels/App_TextStyle.dart';

class TextFileForComment extends StatelessWidget {
  const TextFileForComment({super.key, required this.hinttext, required this.suffix});
final String hinttext;
final Widget suffix;
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        suffixIcon: suffix,

        filled: true,
        fillColor: const Color(0xFFF9FAFA),
        border: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
        enabledBorder: buildOutlineInputBorder(),
        hintText: hinttext,
        helperStyle: AppStyle.bold13.copyWith(color: Color(0xFF949D9E)),
      ),

    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        width: 1,
        color: Color(0xFFE6E9E9),
      ),
    );
  }
}
