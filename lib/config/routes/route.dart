import 'package:go_router/go_router.dart';
import '../../feature/auth/presentation/welcome_page.dart';
import '../../feature/main/main_page.dart';

class AppRoutes {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/${WelcomePage.routeName}',
        name: WelcomePage.routeName,
        builder: (context, state) {
          return const WelcomePage();
        },
      ),
      GoRoute(
        path: '/${MainPage.routeName}',
        name: MainPage.routeName,
        builder: (context, state) {
          return const MainPage();
        },
      ),
    ],
    initialLocation: '/welcome_page',
    debugLogDiagnostics: true,
    routerNeglect: true,
  );
}
