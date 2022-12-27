import '../env_config.dart';

class DevEnvConfig implements BaseEnvConfig {
  const DevEnvConfig();
  @override
  String get name => AppEnvironment.dev.value;

  @override
  String get baseUrl => 'http://api.openweathermap.org';

  @override
  String get storageHost => throw UnimplementedError();

  @override
  String get oAuthClintIdIos => throw UnimplementedError();

  @override
  String get oAuthClintIdWeb => throw UnimplementedError();

  @override
  String toString() {
    return 'DEVELOPMENT';
  }
}
