part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}
class UserLoaded extends UserState {
   List<User> Users;
  UserLoaded(this.Users);
}
class UserInserted extends UserState {}
class UserUpdated extends UserState {}