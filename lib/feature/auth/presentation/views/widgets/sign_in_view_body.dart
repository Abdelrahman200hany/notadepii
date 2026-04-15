import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/core/utils/app_colors.dart';
import 'package:nota/core/widgets/custom_text_buttom_with_background_color.dart';
import 'package:nota/core/widgets/custom_text_form_feild.dart';
import 'package:nota/core/widgets/custom_text_form_feild_for_password.dart';
import 'package:nota/feature/auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:nota/feature/auth/presentation/views/sign_up_view.dart';
import 'package:nota/feature/auth/presentation/views/widgets/Google_buttom.dart';
import 'package:nota/feature/auth/presentation/views/widgets/create_new_account_buttom.dart';
import 'package:nota/feature/auth/presentation/views/widgets/or_divider.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key, required this.isLoading});
  final bool isLoading;

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
                  'quick Notes ',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textColor,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'quick Notes ',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.hintTextColor,
                  ),
                ),
                const SizedBox(height: 24),
                CustomTextFormFeild(
                  textInputType: TextInputType.emailAddress,
                  labelText: 'Email',
                ),
                const SizedBox(height: 24),
                CustomTextFormFieldForPasswoed(labelText: 'Password'),
                const SizedBox(height: 24),
                CustomTextBottomWithBackground(
                  text: 'signIn',
                  isLoading: isLoading,
                ),
                const SizedBox(height: 16),
                Ordivider(),

                const SizedBox(height: 16),
                GoogleButtom(
                  onTap: () {
                    context.read<SignInCubit>().signInWithGoogle();
                  },
                ),

                const SizedBox(height: 48),
                CreateNewAccountTextButtom(
                  fristText: 'do not have account ? ',
                  secondText: 'Create one',
                  onTap: () {
                    Navigator.pushNamed(context, SignUpView.routeName);
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
