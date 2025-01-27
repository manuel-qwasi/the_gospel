import 'package:go_router/go_router.dart';
import 'package:the_gospel/views/home/widgets/home_bottom_tab.dart';
import 'package:the_gospel/views/onboarding/get_started.dart';
import 'package:the_gospel/views/onboarding/splash_screen.dart';

class AppRouter {
  final GoRouter router;

  AppRouter()
      : router = GoRouter(
          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => const SplashScreen(),
            ),
            GoRoute(
              path: '/get-started',
              builder: (context, state) => const GetStarted(),
            ),
            GoRoute(
              path: '/home-tab',
              builder: (context, state) => const HomeBottomTab(),
            ),
          ],
        );
}
