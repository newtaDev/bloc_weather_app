part of app_dependencies;

void registerRepositoryDependencies() {
  getIt.registerSingleton<WeatherRepoImpl>(
    WeatherRepoImpl(weatherRds: getIt<WeatherRemoteDataSource>()),
  );
}
