import 'package:flutter/material.dart';
import '../../../core/constants/method_const.dart';


class PasswordInput extends StatelessWidget {
  const PasswordInput({
    Key? key,
    required this.onChanged,
    required this.initialValue,
    this.errorText,
    this.focusNode,
  }) : super(key: key);
  final ValueChanged<String> onChanged;
  final String initialValue;
  final String? errorText;
  final FocusNode? focusNode;
  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> _isObscure = ValueNotifier<bool>(true);

    return ValueListenableBuilder(
        valueListenable: _isObscure,
        builder: (context, value, child) {
          return TextFormField(
              focusNode: focusNode,
              autofocus: false,
              textInputAction: TextInputAction.done,
              initialValue: initialValue,
              obscureText: _isObscure.value,
              autocorrect: false,
              enableSuggestions: false,
              keyboardType: TextInputType.visiblePassword,
              decoration: inputDecorationPassword(
                hintText: 'Password',
                context: context,
                errorText: errorText,
                suffixIcon: IconButton(
                  icon: Icon(
                    _isObscure.value ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    _isObscure.value = !_isObscure.value;
                  },
                ),
              ),
              onChanged: onChanged);
        });
  }
}
