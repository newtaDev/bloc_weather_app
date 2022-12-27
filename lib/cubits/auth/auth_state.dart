part of 'auth_cubit.dart';

enum AuthStatus {
  initial,
  loading,
  logedIn,
  logedOut,
  failure,
}

class AuthState extends Equatable {
  final AuthStatus status;
  final ApiErrorRes? error;
  const AuthState(
    this.status,
    this.error,
  );
  const AuthState.init()
      : error = null,
        status = AuthStatus.initial;

  @override
  List<Object?> get props => [status, error];

  AuthState copyWith({
    AuthStatus? status,
    ApiErrorRes? error,
  }) {
    return AuthState(
      status ?? this.status,
      error ?? this.error,
    );
  }
}
