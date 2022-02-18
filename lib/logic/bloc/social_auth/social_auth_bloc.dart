import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/constants/strings.dart';
import '../../../data/error/exception_firebase_message.dart';
import '../../../data/repositories/auth_repository.dart';

part 'social_auth_event.dart';
part 'social_auth_state.dart';

class SocialAuthBloc extends Bloc<SocialAuthEvent, SocialAuthState> {
    final AuthRepository authRepository;
  SocialAuthBloc({required this.authRepository}) : super(const SocialAuthState()) {
    on<GoogleSigning>(_onLoginWithGoogle);
  }
   FutureOr<void> _onLoginWithGoogle(
      GoogleSigning event, Emitter<SocialAuthState> emit) async {
     emit(state.copyWith(
          status:  LogInSocialStatus.loading, ));
    try {
      await authRepository.signInWithGoogle();
      Future<void>.delayed(const Duration(seconds: 1));
     emit(state.copyWith(
          status:  LogInSocialStatus.success, ));
    
    } on LogInWithGoogleFailure catch (e) {
      logger.e(e.message);
      emit(state.copyWith(
          status:  LogInSocialStatus.fail, errorMessage: e.message));
    } catch (e) {
      logger.e(e);
      emit(state.copyWith(status: LogInSocialStatus.fail));
    }
  }
}
