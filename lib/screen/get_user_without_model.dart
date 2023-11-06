import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class GetUserWithoutModel extends StatefulWidget{
  const GetUserWithoutModel({super.key});

  @override
  State<StatefulWidget> createState() {
  return GetUserWithoutModelState();
  }
}

class GetUserWithoutModelState extends State<GetUserWithoutModel>{

  var data;
  Future<void> getUserData() async{
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    var userData = jsonDecode(response.body);
    if(response.statusCode == 200){
      data = userData;
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Get USer Data Without Model"),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
                future: getUserData(),
                builder: (context , snapshot){
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Center(
                      child: Text("Loading...."),
                    );
                  }
                  else{
                    return ListView.builder(
                      itemCount: data.length,
                        itemBuilder: (context , index){
                          return Card(
                            child: Column(
                              children: [
                                ReusableRow(title: "Name", value: data[index]['name'].toString()),
                                ReusableRow(title: "User Name", value: data[index]['username'].toString()),
                                ReusableRow(title: "Address", value: data[index]['address']['street'].toString()),
                              ],
                            ),
                          );
                        });
                  }
                },
              )
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
