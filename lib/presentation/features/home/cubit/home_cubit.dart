import 'package:bloc_weather_app/data/models/dto/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState.init());

  void addUser(UserModel user) {
    final users = [...state.users, user];
    emit(state.copyWith(users: users));
  }

  void removeUser(int index) {
    final users = List<UserModel>.from(state.users)..removeAt(index);
    emit(state.copyWith(users: users));
  }
}
