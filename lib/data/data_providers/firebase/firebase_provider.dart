import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../core/constants/strings.dart';
import '../../error/exception_firebase_message.dart';
import 'i_auth_provider.dart';

class FirebaseWebService implements IAuthProvider {
  final FirebaseAuth firebaseAuth;
  FirebaseWebService() : firebaseAuth = FirebaseAuth.instance;

  @override
  Future<void> signUp({required String email, required String password}) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseAuth.userChanges().listen((event) {
        logger.i(event);
      });
    } on FirebaseAuthException catch (e) {
      throw SignUpWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const SignUpWithEmailAndPasswordFailure();
    }
  }

  @override
  Future<void> signInWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      final googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await firebaseAuth.signInWithCredential(credential);
      firebaseAuth.userChanges().listen((event) {
        logger.i(event);
      });
    } on FirebaseAuthException catch (e) {
      throw LogInWithGoogleFailure.fromCode(e.code);
    } catch (_) {
      throw const LogInWithGoogleFailure();
    }
  }

  @override
  Future<void> sendEmailVerification(User? user) async {
    try {
      await user?.sendEmailVerification();
      firebaseAuth.userChanges().listen((event) {
        logger.i(event);
      });
    } on FirebaseAuthException catch (e) {
      throw SignUpWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const SignUpWithEmailAndPasswordFailure();
    }
  }

  @override
  Future<void> logOut() async {
    try {
      await Future.wait([
        firebaseAuth.signOut(),
        GoogleSignIn().signOut(),
      ]);
    } catch (_) {
      throw LogOutFailure();
    }
  }

  @override
  bool isSignedIn() {
    var currentUser = firebaseAuth.currentUser;
    return currentUser != null;
  }

  @override
  User? getUser() {
    var currentUser = firebaseAuth.currentUser;
    return currentUser;
  }

  @override
  Future<void> loginWithCredentials(
      {required String email, required String password}) async {
    try {
      logger.i("data");
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      firebaseAuth.userChanges().listen((event) {
        logger.i(event);
      });
      // return data;
    } on FirebaseAuthException catch (e) {
      throw LogInWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (e) {
      throw const LogInWithEmailAndPasswordFailure();
    }
  }
}


