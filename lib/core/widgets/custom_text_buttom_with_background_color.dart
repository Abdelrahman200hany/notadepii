import 'package:flutter/material.dart';
import 'package:nota/core/utils/app_colors.dart';

class CustomTextBottomWithBackground extends StatelessWidget {
  const CustomTextBottomWithBackground({
    super.key,
    this.ontap,
    required this.text,
    this.isLoading = false,
    this.textColor = Colors.white,
    this.backGroundColor = AppColors.primaryColor,
  
  });
  final void Function()? ontap;
  final String text;
  final bool isLoading;
  final Color textColor, backGroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      width: double.infinity,
      child: TextButton(
        onPressed: ontap,
        style: TextButton.styleFrom(
          backgroundColor: backGroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(16),
          ),
        ),
        child: isLoading
            ? CircularProgressIndicator(color: Colors.white)
            : Center(
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
              ),
      ),
    );
  }
}
