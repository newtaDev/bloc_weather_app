library app_dependencies;

import 'package:bloc_weather_app/data/data_source/remote/weather_rds.dart';
import 'package:bloc_weather_app/data/repositories/weather_repo_impl.dart';
import 'package:bloc_weather_app/presentation/features/home/cubit/home_cubit.dart';
import 'package:bloc_weather_app/presentation/features/weather/cubit/weather_forcast_cubit.dart';

import '../../cubits/auth/auth_cubit.dart';
import '../../cubits/my_app/my_app_cubit.dart';
import '../../data/data_source/local/auth_lds.dart';
import '../app_config.dart';

part 'src/cubits_di.dart';
part 'src/ds_di.dart';
part 'src/repo_di.dart';

/// Manual `GetIt` dependency injection
void registerGetItDependencies(AppConfig appConfig) {
  getIt.registerSingleton<AppConfig>(appConfig);
  registerDataSourcesDependencies();
  registerRepositoryDependencies();
  registerCubitsDependencies();
}
