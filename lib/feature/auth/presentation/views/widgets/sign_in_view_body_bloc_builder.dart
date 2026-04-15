import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/core/helpers/build_snack_bar.dart';
import 'package:nota/feature/auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:nota/feature/auth/presentation/views/widgets/sign_in_view_body.dart';
import 'package:nota/feature/note/presentation/views/note_view.dart';

class SignInViewBodyBlocBuilder extends StatelessWidget {
  const SignInViewBodyBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInInfaulire) {
          buildErrorSnackBar(context, message: state.errorMessage);
        }
        if (state is SignInSuccess) {
          buildSuccessSnackBar(context, message: 'Welcome to nota');
          Navigator.pushNamed(context, NoteView.routeName);
        }
      },
      builder: (context, state) {
        return SignInViewBody(isLoading: state is SignInLoading ? true : false);
      },
    );
  }
}
