import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/route/routers.dart';
import '../core/theme/app_theme.dart';
import '../logic/cubit/theme/theme_cubit.dart';

class InitializeApp extends StatelessWidget {
  const InitializeApp
({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemeData.lightThemeData,
      darkTheme: AppThemeData.darkThemeData,
      themeMode: context.select((ThemeCubit value) => value.state.themeMode),
      title: 'Newsly app',
      onGenerateInitialRoutes: RouteGenerator.generateInitialRoute,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}