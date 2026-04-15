import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nota/feature/auth/presentation/views/sign_in_view.dart';
// import 'package:nota/feature/home/presentation/views/home_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();

    splashNavigation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Lottie.asset('assets/lottie/nota.json')),
    );
  }

  void splashNavigation() {
    Future.delayed(Duration(seconds: 4, milliseconds: 400), () {
      Navigator.pushNamed(context, SignInView.routeName);
    });
  }
}
