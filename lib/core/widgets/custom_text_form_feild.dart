import 'package:flutter/material.dart';

class CustomTextFormFeild extends StatelessWidget {
  const CustomTextFormFeild({
    super.key,
    this.labelText,
    this.hint,
    this.suffixIcon,
    required this.textInputType,
    this.isHidden = false,
    this.onSaved,
    this.maxlines = 1,
  });

  final String? hint;
  final IconButton? suffixIcon;
  final TextInputType textInputType;
  final bool isHidden;
  final String? labelText;
  final int maxlines;

  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'هذا الحقل مطلوب';
        } else {
          return null;
        }
      },
      onSaved: onSaved,
      obscureText: isHidden,
      maxLines: maxlines,

      keyboardType: textInputType,
      decoration: InputDecoration(
        labelText: labelText,

        labelStyle: TextStyle(color: Colors.black, fontSize: 16),
        fillColor: const Color(0xffF9FAFA),

        filled: true,
        hintText: hint,
        hintStyle: TextStyle(color: const Color(0xFFB9B9B9), fontSize: 14),
        suffixIcon: suffixIcon,

        border: buildBoreder(),

        enabledBorder: buildBoreder(),
        focusedBorder: buildBoreder(),
      ),
    );
  }
}

OutlineInputBorder buildBoreder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
    borderSide: BorderSide(width: 1, color: const Color(0xFFE6E9E9)),
  );
}
