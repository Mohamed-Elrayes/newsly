part of 'login_form_bloc.dart';

abstract class LoginFormEvent extends Equatable {
  const LoginFormEvent();
  @override
  List<Object> get props => [];
}


class UserNameChanged extends LoginFormEvent {
  const UserNameChanged({required this.userName});
  final String userName;
  @override
  List<Object> get props => [userName];
}
class EmailChanged extends LoginFormEvent {
  const EmailChanged({required this.email});
  final String email;
  @override
  List<Object> get props => [email];
}
class PasswordChanged extends LoginFormEvent {
  const PasswordChanged({required this.password});
  final String password;
  @override
  List<Object> get props => [password];
}

class FormSubmittedLogin extends LoginFormEvent {}

class EmailCheck extends LoginFormEvent {
  const EmailCheck({required this.email});
  final String email;
  @override
  List<Object> get props => [email];
}
