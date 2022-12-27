part of app_dependencies;

void registerDataSourcesDependencies() {
  getIt
    ..registerSingleton<AuthLocalDataSource>(AuthLocalDataSource())
    ..registerSingleton<WeatherRemoteDataSource>(WeatherRemoteDataSource());
}
