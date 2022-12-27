import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../cubits/my_app/my_app_cubit.dart';
import '../../../routers/routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<MyAppCubit, MyAppState>(
      listener: (context, state) {
        if (state.splashStatus == SplashStatus.failed) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Text('Internal Server Error'),
              ),
            );
        }

        if (state.splashStatus == SplashStatus.neverLogedIn) {
          context.goNamed(Routes.onboardingScreen.name);
        }
        if (state.splashStatus == SplashStatus.loginSuccess) {
          context.goNamed(Routes.homeScreen.name);
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.wordpress_rounded, size: 46),
                    const SizedBox(height: 20),
                    Text(
                      'Weather App',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Center(
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
