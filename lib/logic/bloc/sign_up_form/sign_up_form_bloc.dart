import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../../core/constants/strings.dart';
import '../../../data/error/error.dart';
import '../../../data/models/validation_model/validation_model.dart';
import '../../../data/repositories/auth_repository.dart';

part 'sign_up_form_event.dart';
part 'sign_up_form_state.dart';

class SignUpFormBloc extends Bloc<SignUpFormEvent, SignUpFormState> {
  final AuthRepository authRepository;

  SignUpFormBloc({required this.authRepository})
      : super(const SignUpFormState()) {
    on<UserNameChanged>(_onUserNameChanged);
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<FormSubmitted>(_onFormSubmitted);
  }

  void _onUserNameChanged(
      UserNameChanged event, Emitter<SignUpFormState> emit) {
    final userName = UserName.dirty(event.userName);
    emit(state.copyWith(
      userName: userName.valid ? userName : UserName.pure(event.userName),
      status: Formz.validate([state.email, state.password, userName]),
    ));
  }

  void _onEmailChanged(EmailChanged event, Emitter<SignUpFormState> emit) {
    final email = Email.dirty(event.email);
    emit(state.copyWith(
      email: email.valid ? email : Email.pure(event.email),
      status: Formz.validate([email, state.password, state.userName]),
    ));
  }

  void _onPasswordChanged(
      PasswordChanged event, Emitter<SignUpFormState> emit) {
    final password = Password.dirty(event.password);
    emit(state.copyWith(
      password: password.valid ? password : Password.pure(event.password),
      status: Formz.validate([state.email, state.userName, password]),
    ));
  }

  void _onFormSubmitted(
      FormSubmitted event, Emitter<SignUpFormState> emit) async {
    if (state.status.isValidated) {
        emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
        await authRepository.signUp(
            email: state.email.value, password: state.password.value);
       
        emit(state.copyWith(status: FormzStatus.submissionSuccess));

      } on SignUpWithEmailAndPasswordFailure catch (e) {
        logger.e(e.message);
        emit(state.copyWith(
            status: FormzStatus.submissionFailure, errorMessage: e.message));
      } catch (e) {
        logger.e(e);
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    }
  }
}
