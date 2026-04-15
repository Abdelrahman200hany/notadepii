import 'package:flutter/material.dart';
import 'package:nota/core/utils/app_colors.dart';
import 'package:nota/core/widgets/custom_text_buttom_with_background_color.dart';
import 'package:nota/core/widgets/custom_text_form_feild.dart';
import 'package:nota/core/widgets/custom_text_form_feild_for_password.dart';
import 'package:nota/feature/auth/presentation/views/widgets/create_new_account_buttom.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 24),
                Text(
                  'Create Account ',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textColor,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'start organzing your thoughts today',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.hintTextColor,
                  ),
                ),
                const SizedBox(height: 24),
                CustomTextFormFeild(
                  textInputType: TextInputType.text,
                  labelText: 'name',
                ),
                const SizedBox(height: 16),
                CustomTextFormFeild(
                  textInputType: TextInputType.emailAddress,
                  labelText: 'emial',
                ),
                const SizedBox(height: 16),
                CustomTextFormFieldForPasswoed(labelText: 'Password'),
                const SizedBox(height: 24),

                CustomTextBottomWithBackground(text: 'create account'),
                const SizedBox(height: 24),
                CreateNewAccountTextButtom(
                  fristText: 'you have an account ? ',
                  secondText: 'login',
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
