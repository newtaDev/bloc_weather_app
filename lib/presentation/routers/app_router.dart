import 'package:bloc_weather_app/config/app_config.dart';
import 'package:bloc_weather_app/presentation/features/_init_/onboard/onboarding_sceen.dart';
import 'package:bloc_weather_app/presentation/features/home/cubit/home_cubit.dart';
import 'package:bloc_weather_app/presentation/features/home/home_screen.dart';
import 'package:bloc_weather_app/presentation/features/weather/weather_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../features/_init_/splash/splash_screen.dart';
import '../features/auth/sign_in/sign_in_screen.dart';
import '../features/weather/cubit/weather_forcast_cubit.dart';
import 'routes.dart';

/// Dont add to `getIt` bcz we are only using static properties
class AppRouter {
  static final router = GoRouter(
    initialLocation: '/splash',
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        name: Routes.splashScreen.name,
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
          name: Routes.homeScreen.name,
          path: '/',
          builder: (context, state) => BlocProvider(
                create: (context) => getIt<HomeCubit>(),
                child: const HomeScreen(),
              ),
          routes: [
            GoRoute(
              name: Routes.weatherForcastScreen.name,
              path: 'weather/:city',
              builder: (context, state) => BlocProvider(
                create: (context) => getIt<WeatherForcastCubit>(),
                child: WeatherForcastScreen(city: state.params['city']!),
              ),
            )
          ]),
      GoRoute(
        name: Routes.signInScreen.name,
        path: '/sign_in',
        builder: (context, state) => const SignInPage(),
      ),
      GoRoute(
        name: Routes.onboardingScreen.name,
        path: '/onboard',
        builder: (context, state) => const OnBoardingScreen(),
      ),
    ],
  );
}
