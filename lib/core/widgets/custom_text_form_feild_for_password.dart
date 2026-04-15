import 'package:flutter/material.dart';
import 'package:nota/core/widgets/custom_text_form_feild.dart';

class CustomTextFormFieldForPasswoed extends StatefulWidget {
  const CustomTextFormFieldForPasswoed({
    super.key,
    this.onSaved,
    this.hint = 'كلمة المرور',
    this.labelText,
  });
  // final String hint;
  final void Function(String?)? onSaved;
  final String? hint, labelText;

  @override
  State<CustomTextFormFieldForPasswoed> createState() =>
      _CustomTextFormFieldForPasswoedState();
}

class _CustomTextFormFieldForPasswoedState
    extends State<CustomTextFormFieldForPasswoed> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormFeild(
      hint: widget.hint,
      labelText: widget.labelText,
      textInputType: TextInputType.visiblePassword,
      isHidden: isHidden,
      onSaved: widget.onSaved,
      suffixIcon: IconButton(
        onPressed: () {
          isHidden = !isHidden;
          setState(() {});
        },
        icon: Icon(isHidden ? Icons.visibility : Icons.visibility_off),
      ),
    );
  }
}
