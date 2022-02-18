import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../data/repositories/auth_repository.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthRepository authRepository;
  AuthBloc(this.authRepository) : super(AuthenticationInitial()) {
    on<AuthenticationStarted>(_initializeAuth);
    on<AuthenticationLoggedIn>(_loginAuth);
    // on<AuthEventLoginGoogle>(_loginAuthGoogle);
    on<AuthenticationLoggedOut>(_logoutAuth);
  }

  FutureOr<void> _initializeAuth(
      AuthenticationStarted event, Emitter<AuthenticationState> emit) async {
    final isSignedIn = authRepository.isSignedIn();
    if (isSignedIn) {
      final firebaseUser = authRepository.getUser();
      emit(AuthenticationSuccess(firebaseUser!));
    } else {
      emit(AuthenticationFailure());
    }
  }

  FutureOr<void> _loginAuth(
      AuthenticationLoggedIn event, Emitter<AuthenticationState> emit) {
    emit(AuthenticationSuccess(authRepository.getUser()!));
  }

  FutureOr<void> _logoutAuth(
      AuthenticationLoggedOut event, Emitter<AuthenticationState> emit) async {
    await authRepository.logOut();
    emit(AuthenticationFailure());
  }
}
