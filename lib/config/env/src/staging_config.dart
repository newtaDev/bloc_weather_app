import '../env_config.dart';

class StagingEnvConfig implements BaseEnvConfig {
  const StagingEnvConfig();
  @override
  String get name => AppEnvironment.staging.value;

  @override
  String get baseUrl => 'http://api.openweathermap.org';

  @override
  String get storageHost => throw UnimplementedError();

  @override
  String get oAuthClintIdIos => throw UnimplementedError();

  @override
  String toString() {
    return 'STAGING';
  }

  @override
  String get oAuthClintIdWeb => throw UnimplementedError();
}
