import 'dart:convert';

import 'package:api/model/get_list_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetListData extends StatefulWidget{
  const GetListData({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return GetListDataState();
  }
}

class GetListDataState extends State<GetListData>{
  List<GetList> postList = [];

  Future<List<GetList>> getData() async{
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    var data = jsonDecode(response.body);
    if(response.statusCode == 200){
      postList.clear();
      for(Map i in data){
        postList.add(GetList.fromJson(i));
      }
      return postList;
    }
    else{
      return postList;
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                  child: FutureBuilder(
                    future: getData(),
                    builder: (context , snapshot){
                      if(snapshot.connectionState == ConnectionState.waiting){
                        return Text("Loading......");
                      }
                      else if(snapshot.hasError){
                        return Text(snapshot.error.toString());
                      }
                      else if(snapshot.hasData){
                        return ListView.builder(
                          itemCount: postList.length,
                            itemBuilder: (context , index){
                            return Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Title\n" + postList[index].title.toString()),
                                    Text("Description\n" + postList[index].body.toString()),
                                  ],
                                ),
                              ),
                            );
                            });
                      }
                      else{
                        return Text(snapshot.error.toString());
                      }
                    },
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}