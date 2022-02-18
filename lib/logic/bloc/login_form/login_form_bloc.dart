import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import '../../../core/constants/strings.dart';
import '../../../data/error/error.dart';
import '../../../data/models/models.dart';
import '../../../data/repositories/auth_repository.dart';

part 'login_form_event.dart';
part 'login_form_state.dart';

class LoginFormBloc extends Bloc<LoginFormEvent, LoginFormState> {
  final AuthRepository authRepository;

  LoginFormBloc({required this.authRepository})
      : super(const LoginFormState()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<FormSubmittedLogin>(_onFormSubmitted);
  }

  void _onEmailChanged(EmailChanged event, Emitter<LoginFormState> emit) async {
    final email = Email.dirty(event.email);
    emit(
      state.copyWith(
        email: email.valid ? email : Email.pure(event.email),
        status: Formz.validate([email, state.password]),
      ),
    );
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginFormState> emit) {
    final password = Password.dirty(event.password);
    emit(state.copyWith(
      password: password.valid ? password : Password.pure(event.password),
      status: Formz.validate([state.email, password]),
    ));
  }

  void _onFormSubmitted(
      FormSubmittedLogin event, Emitter<LoginFormState> emit) async {
    if (state.status.isValidated) {
      try {
        emit(state.copyWith(status: FormzStatus.submissionInProgress));
        await authRepository.loginWithCredentials(
            email: state.email.value, password: state.password.value);
        Future<void>.delayed(const Duration(seconds: 1));
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      } on LogInWithEmailAndPasswordFailure catch (e) {
        logger.e(e.message);
        emit(state.copyWith(
            status: FormzStatus.submissionFailure, errorMessage: e.message));
      } catch (e) {
        logger.e(e);
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    } else {
      final email = Email.dirty(state.email.value);
      final password = Password.dirty(state.password.value);
      emit(state.copyWith(
          email: email, password: password, status: FormzStatus.invalid));
    }
  }

 
}
