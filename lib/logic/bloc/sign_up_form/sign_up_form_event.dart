part of 'sign_up_form_bloc.dart';

abstract class SignUpFormEvent extends Equatable {
  const SignUpFormEvent();
  @override
  List<Object> get props => [];
}


class UserNameChanged extends SignUpFormEvent {
  const UserNameChanged({required this.userName});
  final String userName;
  @override
  List<Object> get props => [userName];
}
class EmailChanged extends SignUpFormEvent {
  const EmailChanged({required this.email});
  final String email;
  @override
  List<Object> get props => [email];
}
class PasswordChanged extends SignUpFormEvent {
  const PasswordChanged({required this.password});
  final String password;
  @override
  List<Object> get props => [password];
}

class FormSubmitted extends SignUpFormEvent {}
