import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthProvider {
  User? getUser();
  bool isSignedIn();
  Future<void> sendEmailVerification(User? user);
  Future<void> loginWithCredentials(
      {required String email, required String password});
  Future<void> signUp({required String email, required String password});
  Future<void> logOut();
  Future<void> signInWithGoogle();
}
