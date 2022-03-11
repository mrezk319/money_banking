import 'package:banking_app/Bloc_Layer/transfer_cubit.dart';
import 'package:banking_app/Bloc_Layer/user_cubit.dart';
import 'package:banking_app/Data/Repo/TransferStorageRepo.dart';
import 'package:banking_app/Screens/HomeScreen.dart';
import 'package:banking_app/Screens/TransfersScreen.dart';
import 'package:banking_app/Screens/UserDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Data/Database/LocalStorage.dart';
import 'Data/Models/User.dart';
import 'Data/Repo/UserStorageRepo.dart';
import 'Screens/UsersScreen.dart';

class AppRouter {

  late UserDatabaseRepo userdatabaseRepo;
  late UserCubit _userCubit;
  late TransferDatabaseRepo transferDatabaseRepo;
  late TransferCubit _transferCubit;
  AppRouter() {
    userdatabaseRepo = UserDatabaseRepo(DatabaseHandler());
    _userCubit = UserCubit(userdatabaseRepo);
    transferDatabaseRepo=TransferDatabaseRepo(DatabaseHandler());
    _transferCubit=TransferCubit(transferDatabaseRepo);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => homeScreen(),
        );
      case 'UserScreen':
        return MaterialPageRoute(
            builder: (_) =>
                BlocProvider(
                  create: (BuildContext context) => _userCubit,
                  child: usersScreen(),
                ));
      case 'User_Details':
        User user = settings.arguments as User;
        return MaterialPageRoute(
          builder: (_) =>
              MultiBlocProvider(
                providers: [BlocProvider(
                  create: (BuildContext context) => _userCubit),BlocProvider(
          create: (BuildContext context) => _transferCubit)],
                child: userdetails(user),
              ),
        );
      case 'TransferScreen':
        return MaterialPageRoute(
            builder: (_) =>
                BlocProvider(
                  create: (BuildContext context) => _transferCubit,
                  child: transferScreen(),
                ));
    }
  }
}
