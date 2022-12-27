import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:bloc_weather_app/data/data_source/local/auth_lds.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/errors/api_errors.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthLocalDataSource authLds;
  AuthCubit({
    required this.authLds,
  }) : super(const AuthState.init());

  Future<void> singInUser(String email, password) async {
    if (email != 'testapp@google.com' || password != 'Test@123456') {
      final apiErrorRes = ApiErrorRes(message: 'Invalid Email or password');
      emit(state.copyWith(status: AuthStatus.failure, error: apiErrorRes));
      return;
    }
    authLds.saveAuthRes(email: email, password: password);
    emit(state.copyWith(status: AuthStatus.logedIn));
  }

  bool isValidFormInput(GlobalKey<FormState> formKey) {
    if (formKey.currentState?.validate() ?? false) {
      return true;
    }
    return false;
  }

  Future<void> logoutUser() async {
    try {
      emit(state.copyWith(status: AuthStatus.loading));
      authLds.clear();
      emit(const AuthState.init());
    } catch (e) {
      emit(state.copyWith(status: AuthStatus.failure));
      rethrow;
    }
  }
}
