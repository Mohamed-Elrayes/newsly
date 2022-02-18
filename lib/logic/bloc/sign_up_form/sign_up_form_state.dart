part of 'sign_up_form_bloc.dart';

class SignUpFormState extends Equatable {
  const SignUpFormState({
    this.email = const Email.pure(),
    this.userName = const UserName.pure(),
    this.password = const Password.pure(),
    this.status = FormzStatus.pure,
    this.errorMessage,
  });

  final Email email;
  final Password password;
  final UserName userName;
  final FormzStatus status;
  final String? errorMessage;

  @override
  List<Object> get props => [
        email,
        password,
        userName,
        status,
      ];

  
  

  SignUpFormState copyWith({
    Email? email,
    Password? password,
    UserName? userName,
    FormzStatus? status,
    String? errorMessage,
  }) {
    return SignUpFormState(
      email: email ?? this.email,
      password: password ?? this.password,
      userName: userName ?? this.userName,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
