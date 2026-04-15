import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nota/core/utils/app_colors.dart';

class CreateNewAccountTextButtom extends StatelessWidget {
  const CreateNewAccountTextButtom({
    this.onTap,
    super.key,
    required this.fristText,
    required this.secondText,
  });
  final String fristText, secondText;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: fristText,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = onTap,
            text: secondText,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
