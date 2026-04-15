import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nota/core/errors/custom_expetion.dart';

class FirebaseAuthServiecs {
  Future<User> signInWithGoogle() async {
    // to open dailog to choose google account
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      throw CustomExpetion(errorMessage: 'you must choice one account ');
    }

    //  get the authentication object carry tokens  to provide to firebase
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // the main method in fire base
    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }
}
