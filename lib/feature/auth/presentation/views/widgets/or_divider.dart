import 'package:flutter/material.dart';
import 'package:nota/core/utils/app_colors.dart';

class Ordivider extends StatelessWidget {
  const Ordivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: AppColors.hintTextColor)),
        const SizedBox(width: 8),

        Text(
          'Or Contiue With',
          style: TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(child: Divider(color: AppColors.hintTextColor)),
      ],
    );
  }
}
