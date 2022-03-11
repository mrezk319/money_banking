import 'package:banking_app/Bloc_Layer/transfer_cubit.dart';
import 'package:banking_app/Data/Database/LocalStorage.dart';
import 'package:banking_app/Data/Models/Transfers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class transferScreen extends StatefulWidget {
  @override
  _transferScreenState createState() => _transferScreenState();
}

class _transferScreenState extends State<transferScreen> {
  late DatabaseHandler handler;
  List<Transfer> allTransfers = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    load();
  }
  void load()async
  {
     handler = DatabaseHandler();
     await handler.initializeDB();
    await BlocProvider.of<TransferCubit>(context).retrieveItems();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    BlocProvider.of<TransferCubit>(context).close();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text("All Transactions"),
          foregroundColor: Colors.black,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: BlocBuilder<TransferCubit,TransferState>(
          builder: (BuildContext context, state) {
            if(state is TransferLoaded)
            {
              allTransfers=(state).transfer;
              if(allTransfers.isNotEmpty) {
                return  ListView.builder(
                  itemCount:allTransfers.length ,
                  padding: EdgeInsets.all(2.0),
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap:(){},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          height: 60,
                          width: double.infinity,
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(allTransfers[index].sender,style: TextStyle(fontSize:15 ,color: Colors.blue),),
                                      SizedBox(width: 3.0,),
                                      Icon(Icons.arrow_forward,color: Colors.green,),
                                      SizedBox(width: 3.0,),
                                      Text(allTransfers[index].receiver,style: TextStyle(fontSize:15 ,color: Colors.red),)
                                    ]
                                ),
                              ),
                              Center(
                                  child:  Text(" ${allTransfers[index].balance.toString()} \$",style: TextStyle(
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
