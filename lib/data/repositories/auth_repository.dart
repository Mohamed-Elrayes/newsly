import 'package:firebase_auth/firebase_auth.dart';

import '../data_providers/firebase/firebase_provider.dart';
import '../data_providers/firebase/i_auth_provider.dart';

class AuthRepository implements IAuthProvider {
  final FirebaseWebService _firebaseWebService;
  AuthRepository() : _firebaseWebService = FirebaseWebService();
  @override
  User? getUser() => _firebaseWebService.getUser();

  @override
  bool isSignedIn() => _firebaseWebService.isSignedIn();

  @override
  Future<void> logOut() => _firebaseWebService.logOut();

  @override
  Future<void> loginWithCredentials(
          {required String email, required String password}) =>
      _firebaseWebService.loginWithCredentials(
          email: email, password: password);
  @override
  Future<void> sendEmailVerification(User? user) =>
      _firebaseWebService.sendEmailVerification(user);

  @override
  Future<void> signInWithGoogle() => _firebaseWebService.signInWithGoogle();

  @override
  Future<void> signUp({required String email, required String password}) =>
      _firebaseWebService.signUp(email: email, password: password);
}
