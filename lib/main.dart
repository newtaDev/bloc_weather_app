import 'package:bloc_weather_app/presentation/routers/app_router.dart';
import 'package:bloc_weather_app/shared/global/global_keys.dart';
import 'package:bloc_weather_app/shared/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/app_config.dart';
import 'cubits/auth/auth_cubit.dart';
import 'cubits/my_app/my_app_cubit.dart';

void main() async {
  await appConfig.config();
  Bloc.observer = AppBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(lazy: false, create: (context) => getIt<AuthCubit>()),
        BlocProvider(lazy: false, create: (context) => getIt<MyAppCubit>()),
      ],
      child: MaterialApp.router(
        title: 'College App',
        themeMode: ThemeMode.light,
        theme: ThemeData.light().copyWith(
          colorScheme: const ColorScheme.light().copyWith(
            primary: Colors.black,
          ),
        ),
        scaffoldMessengerKey: GlobalKeys.scaffoldMessengerKey,
        routeInformationParser: AppRouter.router.routeInformationParser,
        routerDelegate: AppRouter.router.routerDelegate,
        routeInformationProvider: AppRouter.router.routeInformationProvider,
      ),
    );
  }
}
