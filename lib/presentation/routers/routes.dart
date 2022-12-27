enum Routes {
  splashScreen,
  onboardingScreen,
  signInScreen,
  homeScreen,
  weatherForcastScreen;

  static Routes? fromName(String name) {
    for (final Routes route in Routes.values) {
      if (route.name == name) return route;
    }
    return null;
  }
}
