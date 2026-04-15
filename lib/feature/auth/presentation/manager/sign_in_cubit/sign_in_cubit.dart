import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:nota/feature/auth/domain/repos/auth_repo.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepo) : super(SignInInitial());
  final AuthRepo authRepo;

  Future<void> signInWithGoogle() async {
    emit(SignInLoading());

    var result = await authRepo.signInWithGoogle();

    result.fold(
      (f) {
        emit(SignInInfaulire(errorMessage: f.errorMessage));
      },
      (e) {
        emit(SignInSuccess());
      },
    );
  }
}
