import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class PostData extends StatefulWidget{
  const PostData({super.key});

  @override
  State<StatefulWidget> createState() {
    return PostDataState();
  }
}

class PostDataState extends State<PostData>{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(String email , password) async{
    try{
      Response response = await http.post(Uri.parse("https://reqres.in/api/register"),
        body: {
        'email':email,
          'password':password,
        }
      );
      if(response.statusCode == 200){
        var data =jsonDecode(response.body);
        print(data);
        print(data['token']);
        print("success");

      }
      else{
        print("error");
      }

    }catch(e){
      print(e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Data"),
      ),
      body: Center(
        child: Padding(
          padding:  const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
          child: Column(
            children: [
              const SizedBox(height: 20,),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "Email",
                ),
              ),
              const SizedBox(height: 20,),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: "Password",
                ),
              ),
              const SizedBox(height: 40,),
              InkWell(
                onTap: (){
                  login(emailController.text.toString() , passwordController.text.toString());
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Center(
                    child: Text("Log in" , style: TextStyle(
                      fontSize: 20,
                      color: Colors.white
                    ),),
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}