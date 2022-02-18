import 'package:flutter/material.dart';
import '../../data/models/generate/article/article_item_model.dart';
import '../../presentation/screens/details_article_item_screen.dart';
import '../../presentation/screens/initial_screen.dart';
import '../../presentation/screens/web_view_screen.dart';
import '../../presentation/screens/auth/sign_up_screen.dart';
import '../../presentation/screens/bottom_nav_screen.dart';
import '../../presentation/screens/auth/log_in_screen.dart';
import '../../presentation/screens/auth/terms_and_conditions.dart';
import 'routes_name.dart';



class RouteGenerator {
  static List<Route> generateInitialRoute(String settings) => [
        MaterialPageRoute(
          builder: (_) => const InitialScreen(),
        )
      ];

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.logInPath:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );

      case RoutesName.signUpPath:
        return MaterialPageRoute(
          builder: (_) => const SignUpScreen(),
        );

      case RoutesName.termsAndConditionPath:
        return MaterialPageRoute(
          builder: (_) => const TermsAndConditions(),
        );

      case RoutesName.bottomNavPath:
        return MaterialPageRoute(
          builder: (_) => BottomNavScreen(),
        );

      case RoutesName.detailArticleItemPath:
        return MaterialPageRoute(
          builder: (_) => DetailsArticleItemScreen(
              articleItemModel: settings.arguments as ArticleItem),
        );

      case RoutesName.webViewPath:
        return MaterialPageRoute(
          builder: (_) => WebViewScreen(
            url: settings.arguments as String,
          ),
        );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
