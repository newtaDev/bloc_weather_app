import 'package:bloc_weather_app/shared/assets/assets.dart';
import 'package:bloc_weather_app/shared/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../routers/routes.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late final PageController onboardCtr;
  bool showSignIn = false;
  @override
  void initState() {
    onboardCtr = PageController();
    onboardCtr.addListener(_listner);
    super.initState();
  }

  void _listner() {
    if (onboardCtr.page == 2) {
      showSignIn = true;
      setState(() {});
    } else {
      showSignIn = false;
      setState(() {});
    }
  }

  @override
  void dispose() {
    onboardCtr.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImgAssets.bgPatterns),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: onboardCtr,
                children: [
                  _buildOnBoardingLayouts(
                    title: 'Welcome to the Weather App',
                    description:
                        'Get the latest weather updates and forecasts for your location',
                    lottie: LottieAssets.onboard2,
                  ),
                  _buildOnBoardingLayouts(
                    title: 'Live Weather Updates',
                    description:
                        'Get real-time updates on temperature, humidity, and other weather conditions',
                    lottie: LottieAssets.onboard1,
                  ),
                  _buildOnBoardingLayouts(
                    title: 'Detailed Forecasts',
                    description:
                        'Get detailed forecasts of high and low temperatures, humidity, wind speed and more',
                    lottie: LottieAssets.onboard3,
                  ),
                ],
              ),
            ),
            AnimatedCrossFade(
              duration: Helpers.minDuration,
              crossFadeState: showSignIn
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              firstChild: SizedBox(
                height: 55,
                width: double.maxFinite,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: OutlinedButton(
                      onPressed: () {
                        onboardCtr.animateToPage(2,
                            duration: Helpers.minDuration,
                            curve: Curves.easeInOut);
                      },
                      style: OutlinedButton.styleFrom(
                          shape: const StadiumBorder()),
                      child: const Text('Skip'),
                    ),
                  ),
                ),
              ),
              secondChild: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(55),
                  ),
                  onPressed: () {
                    context.goNamed(Routes.signInScreen.name);
                  },
                  child: const Text('Sign In'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildOnBoardingLayouts({
    required String title,
    required String description,
    required String lottie,
  }) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Expanded(child: Lottie.asset(lottie)),
          Text(
            title,
            style: textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: textTheme.bodyMedium?.copyWith(color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
