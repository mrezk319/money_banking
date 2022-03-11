import 'package:banking_app/Data/Models/User.dart';
import 'package:banking_app/Data/Repo/UserStorageRepo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserDatabaseRepo userDatabaseRepo;
  List<User>Users=[];
  UserCubit(this.userDatabaseRepo) : super(UserInitial());

  Future<List<User>> retrieveItems() async {
    Users=await userDatabaseRepo.retrieveItems();
    emit(UserLoaded(Users));
    print(Users);
    return Users;
  }
  Future<void> insertItems() async {
    await userDatabaseRepo.insertItems();
    emit(UserInserted());
    await retrieveItems();
  }
  Future<void> updateItem(String text,String id) async {
    await userDatabaseRepo.updateItem(text, id);
    emit(UserUpdated());
    await retrieveItems();
  }
}
