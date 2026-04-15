import 'package:firebase_auth/firebase_auth.dart';
import 'package:nota/core/errors/fauilre.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Fauilre, User>> signInWithGoogle();
}
