import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetPhotosList extends StatefulWidget{
  const GetPhotosList({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return GetPhotosListState();
  }
}

class GetPhotosListState extends State<GetPhotosList>{

  List<Photos> photosList = [];

  Future<List<Photos>> getPhotos() async{
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    var data = jsonDecode(response.body);
    if(response.statusCode ==200){
      for(Map i in data){
        Photos photos =Photos(id: i['id'], url: i['url'], title: i['title']);
         photosList.add(photos);
      }
      return photosList;
    }
    else{
      return photosList;
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get Photos List"),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
                child:FutureBuilder(
                  future:getPhotos(),
                  builder: (context , AsyncSnapshot<List<Photos>> snapshot){
                    return ListView.builder(
                      itemCount: photosList.length,
                        itemBuilder: (context, index){
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(snapshot.data![index].url.toString()),
                            ),
                            subtitle: Text(snapshot.data![index].title.toString()),
                            title: Text(snapshot.data![index].id.toString()),
                          );
                        });
                },
                )
            ),
          ],
        ),
      ),
    );
  }
}


class Photos{
  String title , url;
  int id;
  Photos({required this.id , required this.url , required this.title});
}