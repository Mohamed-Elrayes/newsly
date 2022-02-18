import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/bloc/auth/auth_bloc.dart';
import 'bottom_nav_screen.dart';
import 'auth/log_in_screen.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is AuthenticationFailure) {
          return const LoginScreen();
        }
        if (state is AuthenticationSuccess) {
          return const BottomNavScreen();
        }
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
