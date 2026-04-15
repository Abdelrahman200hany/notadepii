import 'package:flutter/material.dart';
import 'package:nota/feature/auth/presentation/views/sign_in_view.dart';
import 'package:nota/feature/auth/presentation/views/sign_up_view.dart';
import 'package:nota/feature/note/presentation/views/add_new_note_view.dart';
import 'package:nota/feature/note/presentation/views/note_view.dart';
import 'package:nota/feature/spalsh/presentation/views/splash_view.dart';

Route<dynamic>? onGenerateRoute(RouteSettings route) {
  switch (route.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());

    case NoteView.routeName:
      return MaterialPageRoute(builder: (context) => const NoteView());

    case AddNewNoteView.routeName:
      return MaterialPageRoute(builder: (context) => const AddNewNoteView());
    case SignInView.routeName:
      return MaterialPageRoute(builder: (context) => const SignInView());
      case SignUpView.routeName:
      return MaterialPageRoute(builder: (context) => const SignUpView());
    default:
      return MaterialPageRoute(builder: (context) => const SplashView());
  }
}
