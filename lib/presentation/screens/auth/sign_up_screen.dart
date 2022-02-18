import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '../../../core/constants/constant_iteration.dart';
import '../../../core/constants/method_const.dart';
import '../../../core/route/routes_name.dart';

import '../../../data/repositories/auth_repository.dart';
import '../../../logic/bloc/sign_up_form/sign_up_form_bloc.dart';
import '../../widgets/auth/email_input.dart';
import '../../widgets/auth/logo_widget.dart';
import '../../widgets/auth/password_input.dart';
import '../../widgets/auth/user_name_input.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/auth/or_divider.dart';

import '../../widgets/custom_text_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).viewPadding.top;
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) =>
              SignUpFormBloc(authRepository: context.read<AuthRepository>()),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 50),
            child: SingleChildScrollView(
              child: SizedBox(
                height: _screenHeight,
                child: Column(
                  children: const [
                    Expanded(flex: 2, child: LogoWidget()),
                    Expanded(flex: 3, child: _FormFields()),
                    Expanded(flex: 2, child: _SignUpAnotherMethod()),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FormFields extends StatelessWidget {
  const _FormFields({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpFormBloc, SignUpFormState>(
      buildWhen: (previous, current) => previous != current,
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) async {
        if (state.status.isSubmissionSuccess) {
          Navigator.of(context).pushNamedAndRemoveUntil(RoutesName.bottomNavPath ,(route) => false,);
        } else if (state.status.isSubmissionFailure) {
          await errorDialog(context, state);
        }
      },
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                UserNameInput(
                  initialValue: state.userName.value,
                  errorText: textErrorInput(
                      isValueFieldEmpty: state.userName.value.isEmpty,
                      isNotValidate: !state.userName.valid,
                      msg: 'user name must be at least 8 characters'),
                  onChanged: (value) => context
                      .read<SignUpFormBloc>()
                      .add(UserNameChanged(userName: value)),
                ),
                const SizedBox(
                  height: 10,
                ),
                EmailInput(
                  initialValue: state.email.value,
                  errorText: textErrorInput(
                      isValueFieldEmpty: state.email.value.isEmpty,
                      isNotValidate: !state.email.valid,
                      msg: 'Please ensure the email entered is valid'),
                  onChanged: (value) => context
                      .read<SignUpFormBloc>()
                      .add(EmailChanged(email: value)),
                ),
                const SizedBox(
                  height: 10,
                ),
                PasswordInput(
                  initialValue: state.password.value,
                  errorText: textErrorInput(
                      isValueFieldEmpty: state.password.value.isEmpty,
                      isNotValidate: !state.password.valid,
                      msg:
                          'Password must be at least 8 characters and contain at least one letter and number'),
                  onChanged: (value) => context.read<SignUpFormBloc>().add(
                        PasswordChanged(password: value),
                      ),
                ),
              ],
            ),
            Flexible(
              child: state.status.isSubmissionInProgress
                  ? const CircularProgressIndicator()
                  : ButtonWidget(
                      label: 'Sign Up',
                      onTap: state.status.isValidated
                          ? () => context
                              .read<SignUpFormBloc>()
                              .add(FormSubmitted())
                          : null),
            ),
          ],
        );
      },
    );
  }
}

class _SignUpAnotherMethod extends StatelessWidget {
  const _SignUpAnotherMethod({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const OrDivider(
          description: "or sign in with",
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 5),
          child: Wrap(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: socialMediaList
                .map(
                  (item) => Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      icon: Icon(item.icon),
                      onPressed: () {},
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Ink(
            child: CustomTextWidget.subTitleBold(
              'I already have account',
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          children: [
            CustomTextWidget.subTitle(
              'By signing up to News24 you are accepting our',
            ),
            Wrap(
              alignment: WrapAlignment.center,
              children: [
                InkWell(
                  onTap: () => Navigator.of(context)
                      .pushNamed(RoutesName.termsAndConditionPath),
                  child: CustomTextWidget.subTitleBold(
                    'Terms & Conditions',
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
