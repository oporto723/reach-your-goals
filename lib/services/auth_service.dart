import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Get user UID
  Future<String> getCurrenUID() async {
    return (_firebaseAuth.currentUser).uid;
  }

// Emial and Password Sign In
  Future<bool> signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return false;
    }
  }

// Email and Password Sign Up
  Future<bool> register(String email, String password) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The Password is to weak');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      return false;
    } catch (e) {
      print(e);
    }
    return false;
  }

// Sign Out
  signOut() {
    return _firebaseAuth.signOut();
  }
}
