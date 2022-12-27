part of app_dependencies;

void registerCubitsDependencies() {
  getIt
    ..registerSingleton<AuthCubit>(
      AuthCubit(authLds: getIt<AuthLocalDataSource>()),
    )
    ..registerSingleton<MyAppCubit>(
      MyAppCubit(
        authLds: getIt<AuthLocalDataSource>(),
      ),
    )
    ..registerFactory<HomeCubit>(() => HomeCubit())
    ..registerFactory<WeatherForcastCubit>(
      () => WeatherForcastCubit(getIt<WeatherRepoImpl>()),
    );
}
