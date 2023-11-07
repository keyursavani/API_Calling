import 'dart:convert';
import 'dart:io';

import 'package:api/model/drop_down_list.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class DropDownListScreen extends StatefulWidget{
  const DropDownListScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DropDownListScreenState();
  }
}

class DropDownListScreenState extends State<DropDownListScreen>{
Future<List<DropDownModel>> getData() async{
 try{
   final response = await  http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
   final body = jsonDecode(response.body) as List;

   if(response.statusCode == 200){
     return body.map((e) {
       final map = e as Map<String , dynamic>;
       return DropDownModel(
         userId: map['userId'],
         id: map['id'],
         title: map['title'],
         body: map['body'],
       );
     }).toList();
   }
 }on SocketException{
   throw Exception("No Internet");
 }
 throw Exception("Error in fetching data");
}
var selectedValue;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Drop Down List"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<List<DropDownModel>>(
                future: getData(),
                builder: (context,snapshot){
                  if(snapshot.hasData){
                    return DropdownButton(
                      hint: const Text("Select Value"),
                        isExpanded: true,
                        value: selectedValue,
                        icon: const Icon(Icons.add),
                        items: snapshot.data!.map((e) {
                          return DropdownMenuItem(
                            value: e.title.toString(),
                              child: Text(e.title.toString()),
                          );
                        }).toList(),
                        onChanged: (value){
                          selectedValue = value;
                          setState(() {
                          });
                        });
                  }
                  else{
                    return const Center(
                      child: Text("Loading...."),
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}