
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsly_app/logic/cubit/bottom_nav_cubit.dart';

import '../core/constants/constant_iteration.dart';
import '../data/repositories/auth_repository.dart';
import '../logic/bloc/articles/articles_bloc.dart';
import '../logic/bloc/auth/auth_bloc.dart';
import '../logic/cubit/bookmark/bookmark_cubit.dart';
import '../logic/cubit/theme/theme_cubit.dart';
import 'initialize_app.dart';

class NewsApp extends StatelessWidget {
  final AuthRepository _authRepository;
  const NewsApp({
    Key? key,
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ThemeCubit()),
          BlocProvider(create: (context) => BottomNavCubit()),
          BlocProvider(
              create: (context) =>
                  AuthBloc(_authRepository)..add(AuthenticationStarted())),
          BlocProvider(
              create: (context) => ArticlesBloc()
                ..add(ArticlesFetch(categoryName: kindArticles[0].headLine))),
          BlocProvider(create: (context) => BookmarkCubit()..getBookmarks()),
        ],
        child: const InitializeApp(),
      ),
    );
  }
}
