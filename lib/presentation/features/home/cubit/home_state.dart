part of 'home_cubit.dart';

class HomeState extends Equatable {
  final List<UserModel> users;

  const HomeState({required this.users});

  const HomeState.init()
      : users = const [
          UserModel('Newton', 'michael', 'newta.dev@gmail.com', 'Mangalore'),
          UserModel('John', 'samuel', 'johnluke@gmail.com', 'Kochi'),
          UserModel('Arun', 'kumar', 'arnuk@gmail.com', 'Kannur'),
        ];

  @override
  List<Object> get props => [users];

  HomeState copyWith({
    List<UserModel>? users,
  }) {
    return HomeState(
      users: users ?? this.users,
    );
  }
}
