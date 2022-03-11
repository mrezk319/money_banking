import 'package:banking_app/Bloc_Layer/user_cubit.dart';
import 'package:banking_app/Data/Database/LocalStorage.dart';
import 'package:banking_app/Data/Models/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class usersScreen extends StatefulWidget {
  @override
  _usersScreenState createState() => _usersScreenState();
}

class _usersScreenState extends State<usersScreen> {
  late DatabaseHandler handler;
  late SharedPreferences _sharedPreferences;
  List<User> allUsers = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    load();
  }
 void load()async
  {
    handler = DatabaseHandler();
    await handler.initializeDB().whenComplete(() => insertdummy());
   await BlocProvider.of<UserCubit>(context).retrieveItems();
  }
  void insertdummy()async
  {
    _sharedPreferences=await SharedPreferences.getInstance();
    if(_sharedPreferences.getString("State")==null)
      {
        BlocProvider.of<UserCubit>(context).insertItems();
        _sharedPreferences.setString("State", "Inserted");
      }
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    BlocProvider.of<UserCubit>(context).close();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        title: RichText(
          text: TextSpan(
              text: "Money ",
              style: TextStyle(
                color: Colors.blue[900],
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              children: <TextSpan>[
                TextSpan(
                    text: "Banking",
                    style: TextStyle(
                      color: Colors.green[300],
                    )),
              ]),
        ),
        centerTitle: true,
        leading: IconButton(onPressed: (){Navigator.pushNamed(context, "TransferScreen");}, icon: Icon(Icons.transfer_within_a_station,color: Colors.black,)),
      ),
      body: BlocBuilder<UserCubit,UserState>(
        builder: (BuildContext context, state) {
          if(state is UserLoaded)
            {
              allUsers=(state).Users;
              if(allUsers.isNotEmpty) {
              return  ListView.builder(
                  itemCount:allUsers.length ,
                  padding: EdgeInsets.all(2.0),
                  itemBuilder: (BuildContext context, int index) {
                   return InkWell(
                     onTap:()=> Navigator.pushNamed(context, "User_Details",arguments: allUsers[index]),
                     child: Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Container(
                         decoration: BoxDecoration(
                           color: Colors.green[100],
                           shape: BoxShape.rectangle,
                           borderRadius: BorderRadius.circular(17),
                           boxShadow: [
                             BoxShadow(
                               color: Colors.black26,
                               blurRadius: 10,
                               offset: Offset(0, 10),
                             ),
                           ],
                         ),
                        padding: const EdgeInsets.all(8.0),
                         height: 60,
                         width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(allUsers[index].name,style: TextStyle(fontSize:18 ,color: Colors.blue),),
                                    Text(allUsers[index].email,style: TextStyle(fontSize:14 ,color: Colors.grey),)
                                  ]
                              ),
                              Center(
                              child:  Text("Balance : ${allUsers[index].balance.toString()} \$",style: TextStyle(
                                color: Colors.green ,fontSize: 16
                              ),)
                              )
                            ],
                          ),
                        ),
                     ),
                   );
                  },
                );
        }
              else{
      return Padding(
        padding: EdgeInsets.all(12),
        child: CircularProgressIndicator(
        ),
      );
          }
            }
          else
            {
              return Center(
                child: CircularProgressIndicator(
                ),
              );
            }
        },)

    );
  }
}
