import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nota/core/errors/fauilre.dart';
import 'package:nota/core/serviecs/fire_base_auth.dart';
import 'package:nota/feature/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthServiecs firebaseAuthServiecs;

  AuthRepoImpl(this.firebaseAuthServiecs);
  @override
  Future<Either<Fauilre, User>> signInWithGoogle() async {
    try {
      var user = await firebaseAuthServiecs.signInWithGoogle();
      return right (user);
    } 
    catch (e) {
      return left(ServerFailure(errorMessage: 'oops there was an error'));
    }
  }
}
