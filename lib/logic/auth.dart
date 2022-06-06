import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationLogic {
  // !accept firebase
  final FirebaseAuth _firebaseAuth;
  AuthenticationLogic(this._firebaseAuth);
  // ! authentication status
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  // !sign in function
  Future<String> register({email, password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Login successfull";
    } on FirebaseAuthException catch (e) {
      return e.message!;
    }
  }

  // !login function
  Future<String> login({email, password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "login successfull";
    } on FirebaseAuthException catch (e) {
      return e.message!;
    }
  }

  // !signout
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
