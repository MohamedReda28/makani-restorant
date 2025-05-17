import 'package:flutter/material.dart';

import '../../../../../core/uitels/App_TextStyle.dart';

class Customtextformfieldonchenge extends StatelessWidget {
  const Customtextformfieldonchenge({super.key, required this.hinttext, required this.textInputType, this.onChange,});
  final String hinttext;
  final TextInputType textInputType;
  final void Function(String?)? onChange;


  Widget build(BuildContext context) {
    return TextFormField(

      onChanged: onChange,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'هذا الحقل مطلوب';
        } else {
          return null;
        }
      },
      keyboardType: textInputType,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFF9FAFA),
        border: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
        enabledBorder: buildOutlineInputBorder(),
        hintText: hinttext,
        helperStyle: AppStyle.bold13.copyWith(color: const Color(0xFF949D9E)),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(
        width: 1,
        color: Color(0xFFE6E9E9),
      ),
    );
  }
}

