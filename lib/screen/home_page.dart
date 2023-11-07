import 'package:api/screen/dropdown_list_screen.dart';
import 'package:api/screen/get_list_data.dart';
import 'package:api/screen/get_photo_list.dart';
import 'package:api/screen/get_user_list_data.dart';
import 'package:api/screen/get_user_without_model.dart';
import 'package:api/screen/post_data_screen.dart';
import 'package:api/screen/product_screen.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15 ,horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context,
                          MaterialPageRoute(builder: (context){
                            return const GetListData();
                          }));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            color: Colors.black54
                          ),
                          child: const Center(
                            child: Text("Get List" ,style: TextStyle(
                              color: Colors.white,
                              fontSize:15 ,
                            ),),
                          ),
                        ),
                      )
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context){
                                return const GetPhotosList();
                              }));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                              color: Colors.black54
                          ),
                          child: const Center(
                            child: Text("Get List WithOut Model" ,style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),),
                          ),
                        ),
                      )
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context){
                                return  const UserListData();
                              }));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                              color: Colors.black54
                          ),
                          child: const Center(
                            child: Text("Get User List Data" ,style: TextStyle(
                              color: Colors.white,
                              fontSize:15 ,
                            ),),
                          ),
                        ),
                      )
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context){
                                return const GetUserWithoutModel();
                              }));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                              color: Colors.black54
                          ),
                          child: const Center(
                            child: Text("Get User Data Without Model " ,style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),),
                          ),
                        ),
                      )
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context){
                                return  const ProductScreen();
                              }));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                              color: Colors.black54
                          ),
                          child: const Center(
                            child: Text("Product Data" ,style: TextStyle(
                              color: Colors.white,
                              fontSize:15 ,
                            ),),
                          ),
                        ),
                      )
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context){
                                return const PostData();
                              }));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                              color: Colors.black54
                          ),
                          child: const Center(
                            child: Text("Post Data" ,style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),),
                          ),
                        ),
                      )
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context){
                                return  const DropDownListScreen();
                              }));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                              color: Colors.black54
                          ),
                          child: const Center(
                            child: Text("Drop Down List" ,style: TextStyle(
                              color: Colors.white,
                              fontSize:15 ,
                            ),),
                          ),
                        ),
                      )
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                      child: InkWell(
                        onTap: (){
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context){
                          //       return const PostData();
                          //     }));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                              color: Colors.black54
                          ),
                          child: const Center(
                            child: Text("" ,style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),),
                          ),
                        ),
                      )
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}