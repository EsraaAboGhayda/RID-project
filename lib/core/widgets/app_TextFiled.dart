import 'package:flutter/material.dart';

import '../resources/style.dart';

class AppTextFieldState extends StatelessWidget {
  final String? label;
  final IconButton? suffixIcon;
  final TextEditingController controller;
  final String hintext;

  const AppTextFieldState({
    super.key,
    this.label,
    this.suffixIcon,
    required this.controller,
    required this.hintext,
  });
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        suffixIconConstraints: const BoxConstraints(
          // maxHeight: 15,
          maxWidth: 15,
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        // hintText: AutofillHints.password,
        suffixIcon: suffixIcon,
        hintStyle: hinttextfild,
        hintText: hintext,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
