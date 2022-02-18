import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('verify Email'),
      ),
      body: Column(
        children: [
          CustomTextWidget.title('Please verify Your email address'),
          TextButton(
              onPressed: () {},
              child: const CustomTextWidget.customSubTitle(
                  'Send email verification'))
        ],
      ),
    );
  }
}
