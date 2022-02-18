import 'package:formz/formz.dart';

enum UserNameValidationError { invalid }

class UserName extends FormzInput<String, UserNameValidationError> {
  const UserName.pure([String value = '']) : super.pure(value);
  const UserName.dirty([String value = '']) : super.dirty(value);

  static final _userName = RegExp(
    r'^(?=[a-zA-Z0-9._]{8,20}$)(?!.*[_.]{2})[^_.].*[^_.]$',
  );

  @override
  UserNameValidationError? validator(String? value) {
    return _userName.hasMatch(value ?? '')
        ? null
        : UserNameValidationError.invalid;
  }
}
