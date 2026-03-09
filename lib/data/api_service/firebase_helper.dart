import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lesson02_flutter/main.dart';

final class FirebaseHelper {
  FirebaseHelper({required this.googleSignIn});

  final GoogleSignIn googleSignIn;
  
  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn.instance;
      final GoogleSignInAccount googleUser = await googleSignIn.authenticate();
      await googleSignIn.initialize();
      final String? idToken = googleUser.authentication.idToken;
      if (idToken == null) {
        return null;
      }

      final credential = GoogleAuthProvider.credential(
        idToken: idToken
      );
      return await FirebaseAuth.instance.signInWithCredential(credential);
      
    } catch (e, s) {
      talker.handle(e, s);
      return null;
    }
  }
}
