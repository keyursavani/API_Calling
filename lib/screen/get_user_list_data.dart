import 'dart:convert';

import 'package:flutter/material.dart';

import '../model/get_user_list_data.dart';
import 'package:http/http.dart' as http;

class UserListData extends StatefulWidget{
  const UserListData({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return UseListDataState();
  }
}

class UseListDataState extends State<UserListData>{
  List<GetUserList> userList = [];
  
  Future<List<GetUserList>> getUser() async{
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    var data = jsonDecode(response.body);
    if(response.statusCode == 200){
      userList.clear();
      for(Map i in data){
        userList.add(GetUserList.fromJson(i));
      }
      return userList;
    }
    else{
      return userList;
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
                future: getUser(),
                builder: (context ,snapshot){
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Center(
                      child: Text("Loading......"),
                    );
                  }
                  else if(snapshot.hasError){
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }
                  else{
                    return ListView.builder(
                        itemCount: userList.length,
                        itemBuilder: (context , index){
                          return Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    ReusableRow(title: "Name", value: snapshot.data![index].name.toString()),
                                    ReusableRow(title: "User Name", value: userList[index].username.toString()),
                                    ReusableRow(title: "Email", value: userList[index].email.toString()),
                                    ReusableRow(title: "Address", value: userList[index].address!.city.toString()),
                                  ],
                                ),
                              ),
                          );
                        });
                  }
                },
              ),
          ),
        ],
      ),
    );
  }
}

class ReusableRow  extends StatelessWidget{
  String title , value;
  ReusableRow({super.key , required this.title , required this.value});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
        padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value),
        ],
      ),
    );
  }
}