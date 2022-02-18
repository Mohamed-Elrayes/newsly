import 'package:flutter/material.dart';
import '../../../core/constants/method_const.dart';

class UserNameInput extends StatelessWidget {
  const UserNameInput({
    required this.onChanged,
    required this.initialValue,
    this.errorText,
    Key? key,
  }) : super(key: key);
  final ValueChanged<String> onChanged;
  final String initialValue;
  final String? errorText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      textInputAction: TextInputAction.next,
      enableSuggestions: false,
      decoration: inputDecoration(
        errorText: errorText,
        context: context,
        hintText: 'userName',
      ),
      onChanged: onChanged,
    );
  }
}
