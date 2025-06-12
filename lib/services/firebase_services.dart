import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseServices {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<User?> registerWithEmail(String email, String password) async {
    try {
      UserCredential result = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      return result.user;
    } on FirebaseAuthException catch (e) {
      throw Exception(e);
    }
  }

  Future<User?> loginWithEmailPass(String email, String password) async {
    try {
      UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return result.user;
    } on FirebaseAuthException catch (e) {
      throw Exception(e);
    }
  }

  User? getCurrentuser() {
    return _firebaseAuth.currentUser;
  }

  
}
