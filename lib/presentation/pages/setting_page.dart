import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/constants/constant_iteration.dart';
import '../../core/route/routes_name.dart';
import '../../logic/bloc/auth/auth_bloc.dart';
import '../../logic/cubit/theme/theme_cubit.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../widgets/widgets.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTextWidget.title('Settings'),
      ),
      body: AnimationLimiter(
        child: ListView(
          children: AnimationConfiguration.toStaggeredList(
            children: ListTile.divideTiles(context: context, tiles: [
              _ListTileWidget(
                trailing: Icon(dataSettingItem[0].iconData),
                iconDataLeading: dataSettingItem[0].iconLabel,
                title: dataSettingItem[0].label,
                onTap: () {},
              ),
              _ListTileWidget(
                trailing: Icon(dataSettingItem[1].iconData),
                iconDataLeading: dataSettingItem[1].iconLabel,
                title: dataSettingItem[1].label,
                onTap: () {},
              ),
              _ListTileWidget(
                trailing: Icon(dataSettingItem[2].iconData),
                iconDataLeading: dataSettingItem[2].iconLabel,
                title: dataSettingItem[2].label,
                onTap: () {},
              ),
              _ListTileWidget(
                trailing: Icon(dataSettingItem[3].iconData),
                iconDataLeading: dataSettingItem[3].iconLabel,
                title: dataSettingItem[3].label,
                onTap: () {},
              ),
              BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
                return SwitchListTile(
                  secondary: Icon(
                    dataSettingItem[4].iconLabel,
                    size: 23,
                  ),
                  title: CustomTextWidget(dataSettingItem[4].label),
                  enableFeedback: false,
                  controlAffinity: ListTileControlAffinity.trailing,
                  value: state.themeMode == ThemeMode.light ? false : true,
                  onChanged: (_) => BlocProvider.of<ThemeCubit>(context)
                      .setUpdateAppThemeManual(),
                );
              }),

              _ListTileWidget(
                trailing: Icon(dataSettingItem[5].iconData),
                iconDataLeading: dataSettingItem[5].iconLabel,
                title: dataSettingItem[5].label,
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(RoutesName.termsAndConditionPath);
                },
              ),
              _ListTileWidget(
                trailing: Icon(dataSettingItem[6].iconData),
                iconDataLeading: dataSettingItem[6].iconLabel,
                title: dataSettingItem[6].label,
                onTap: () {},
              ),
              //logout tab
              _ListTileWidget(
                  trailing: Icon(dataSettingItem[7].iconData),
                  iconDataLeading: dataSettingItem[7].iconLabel,
                  title: dataSettingItem[7].label,
                  onTap: () {
                    context.read<AuthBloc>().add(AuthenticationLoggedOut());
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        RoutesName.logInPath, (route) => false);
                  }),
            ]).toList(),
            childAnimationBuilder: (widget) => SlideAnimation(
              horizontalOffset: 50.0,
              verticalOffset: 10.0,
              child: FadeInAnimation(
                child: widget,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ListTileWidget extends StatelessWidget {
  const _ListTileWidget({
    Key? key,
    required this.trailing,
    required this.title,
    required this.iconDataLeading,
    required this.onTap,
  }) : super(key: key);

  final Widget trailing;
  final String title;
  final IconData iconDataLeading;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // minLeadingWidth: 10,
      onTap: onTap,
      // horizontalTitleGap: 0,
      leading: Icon(
        iconDataLeading,
        size: 23,
      ),
      title: CustomTextWidget(title),
      trailing: trailing,
    );
  }
}
