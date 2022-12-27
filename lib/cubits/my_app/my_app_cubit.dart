import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/data_source/local/auth_lds.dart';

part 'my_app_state.dart';

class MyAppCubit extends Cubit<MyAppState> {
  final AuthLocalDataSource authLds;
  MyAppCubit({
    required this.authLds,
  }) : super(const MyAppState.init()) {
    _appInit();
  }

  Future<void> _appInit() async {
    emit(state.copyWith(splashStatus: SplashStatus.loading));
    await Future<void>.delayed(const Duration(seconds: 2));
    if (!authLds.isLogedIn) {
      emit(state.copyWith(splashStatus: SplashStatus.neverLogedIn));
      return;
    }
    emit(state.copyWith(splashStatus: SplashStatus.loginSuccess));
  }
}
