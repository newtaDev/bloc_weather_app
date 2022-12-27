import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String firstName;
  final String lastName;
  final String email;
  final String place;

  const UserModel(this.firstName, this.lastName, this.email, this.place);
  @override
  List<Object> get props => [firstName, lastName, email, place];
}
