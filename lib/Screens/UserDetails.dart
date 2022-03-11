import 'package:banking_app/Bloc_Layer/transfer_cubit.dart';
import 'package:banking_app/Bloc_Layer/user_cubit.dart';
import 'package:banking_app/Data/Database/LocalStorage.dart';
import 'package:banking_app/Data/Models/Transfers.dart';
import 'package:banking_app/Data/Models/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class userdetails extends StatefulWidget {
  User user;

  userdetails(this.user);

  @override
  _userdetailsState createState() => _userdetailsState(user);
}

class _userdetailsState extends State<userdetails> {
  User user;

  _userdetailsState(this.user);

  late DatabaseHandler handler;
  List<User> allUsers = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    load();
  }

  void load() async {
    BlocProvider.of<UserCubit>(context).retrieveItems();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    BlocProvider.of<UserCubit>(context).close();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,

      appBar: AppBar(
        title: Text(user.name),
        centerTitle: true,
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 50),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.green,
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 15),
                  child: Row(
                    children: [
                      Text(
                        "ID : ",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        user.id,
                        style: TextStyle(color: Colors.black54, fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12.0),
              Container(
                decoration: BoxDecoration(
                  color: Colors.green,
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 15),
                  child: Row(
                    children: [
                      Text(
                        "Name : ",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        user.name,
                        style: TextStyle(color: Colors.black54, fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12.0),
              Container(
                decoration: BoxDecoration(
                  color: Colors.green,
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 15),
                  child: Row(
                    children: [
                      Text(
                        "Email : ",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        user.email,
                        style: TextStyle(color: Colors.black54, fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12.0),
              Container(
                decoration: BoxDecoration(
                  color: Colors.green,
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 15),
                  child: Row(
                    children: [
                      Text(
                        "Phone : ",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        user.phone,
                        style: TextStyle(color: Colors.black54, fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12.0),
              Container(
                decoration: BoxDecoration(
                  color: Colors.green,
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 15),
                  child: Row(
                    children: [
                      Text(
                        "Balance : ",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        user.balance.toString(),
                        style: TextStyle(color: Colors.black54, fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 19.0),

              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
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
                  child: TextButton(
                    onPressed: () async {
                      await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: TextField(
                              controller: controller,
                              keyboardType: TextInputType.number,
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                labelText: "Amount",
                                hintText: "Enter Amount",
                              ),
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () =>
                                      Navigator.of(context, rootNavigator: true)
                                          .pop(false),
                                  child: Text("Cancel")),
                              SizedBox(
                                width: 12,
                              ),
                              TextButton(
                                  onPressed: () async {
                                    if (double.parse(controller.text) >
                                        user.balance) {
                                      await showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              titleTextStyle: TextStyle(
                                                color: Colors.red
                                              ),
                                                //backgroundColor: Colors.red,
                                                content: Text(
                                                    "You have not enough balance"),
                                                title: Text("Failed"),
                                                actions: [
                                                  TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context,
                                                                rootNavigator:
                                                                    true)
                                                            .pop(false);
                                                      },
                                                      child: Text("OK"))
                                                ]);
                                          });
                                    } else {
                                      Navigator.of(context, rootNavigator: true)
                                          .pop(false);
                                      scaffoldKey.currentState!.showBottomSheet((context) {
                                        return BlocBuilder<UserCubit, UserState>(
                                          builder: (context, state) {
                                          if (state is UserLoaded) {
                                            allUsers = (state).Users;
                                            return Container(
                                              height: double.infinity,
                                              width: double.infinity,
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Text(
                                                          "Select Customer to Transfer to : ",style: TextStyle(
                                                        color: Colors.blue,
                                                        fontSize: 19,
                                                        fontWeight: FontWeight.bold,
                                                      ),),
                                                    ),
                                                    SizedBox(
                                                      height: 8,
                                                    ), ListView.builder(
                                                      physics: NeverScrollableScrollPhysics(),
                                                      shrinkWrap: true,
                                                      itemCount: allUsers.length,
                                                      itemBuilder:
                                                          (BuildContext
                                                      context,
                                                          int index) {
                                                        return InkWell(
                                                          onTap: () {
                                                            BlocProvider.of<
                                                                UserCubit>(
                                                                context)
                                                                .updateItem(
                                                                (allUsers[index]
                                                                    .balance +
                                                                    double.parse(
                                                                        controller
                                                                            .text))
                                                                    .toString(),
                                                                allUsers[
                                                                index]
                                                                    .id);
                                                            BlocProvider.of<
                                                                UserCubit>(
                                                                context)
                                                                .updateItem(
                                                                (user.balance -
                                                                    double.parse(
                                                                        controller
                                                                            .text))
                                                                    .toString(),
                                                                user.id);
                                                            BlocProvider.of<TransferCubit>(context).insertItems(
                                                              Transfer(sender: user.name, receiver: allUsers[index].name, balance: double.parse(
                                                                  controller
                                                                      .text)));
                                                            Navigator.of(context,
                                                                rootNavigator:
                                                                true)
                                                                .pop(false);
                                                            Navigator
                                                                .pushNamedAndRemoveUntil(
                                                                context,
                                                                "UserScreen",(Route<dynamic> route) => false);
                                                          },
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
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          }
                                          else {
                                            return CircularProgressIndicator();
                                          }
                                          },
                                        );
                                      });
                                    }
                                  },
                                  child: Text("Ok"))
                            ],
                          );
                        },
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Transfer Money",
                          style: TextStyle(color: Colors.black)),
                    ),
                  ),
                ),
              )
            ]),
      ),
    );
  }
}
