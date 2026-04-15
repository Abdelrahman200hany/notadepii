import 'package:flutter/material.dart';
import 'package:nota/core/serviecs/setup_services_locator.dart';
import 'package:nota/feature/auth/domain/repos/auth_repo.dart';
import 'package:nota/feature/auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/feature/auth/presentation/views/widgets/sign_in_view_body_bloc_builder.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  static const routeName = 'SignInView';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(getIt.get<AuthRepo>()),
      child: const SignInViewBodyBlocBuilder(),
    );
  }
}
