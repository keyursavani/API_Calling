import 'dart:convert';
import 'package:api/model/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget{
  const ProductScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProductScreenState();
  }
}

class ProductScreenState extends State<ProductScreen>{

  Future<ProductModel> getProductData() async{
    final response = await http.get(Uri.parse("https://webhook.site/eb695a30-a543-4648-bf3a-4ea740833485"));
    var data = jsonDecode(response.body);
    if(response.statusCode == 200){
      return ProductModel.fromJson(data);
    }
    else{
      return ProductModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Screen"),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
                child:FutureBuilder<ProductModel>(
                  future: getProductData(),
                  builder: (context, snapshot){
                    if(snapshot.hasData){
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.data!.length,
                          itemBuilder: (context, index){
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  title: Text(snapshot.data!.data![index].shop!.name.toString()),
                                  subtitle: Text(snapshot.data!.data![index].shop!.shopemail.toString()),
                                  leading: CircleAvatar(
                                    backgroundImage: NetworkImage(snapshot.data!.data![index].shop!.image.toString()),
                                  ),
                                ),
                                  Container(
                                    height: MediaQuery.of(context).size.height * .3,
                                    width: MediaQuery.of(context).size.width * 1,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                        itemCount:snapshot.data!.data![index].images!.length,
                                        itemBuilder: (context, position){
                                          return Container(
                                            height: MediaQuery.of(context).size.height * .25,
                                            width: MediaQuery.of(context).size.width * .5,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(snapshot.data!.data![index].images![position].url.toString())
                                              )
                                            ),
                                          );
                                        }),
                                  ),
                                Icon(snapshot.data!.data![index].inWishlist == true ? Icons.favorite : Icons.favorite_border_outlined),
                              ],
                            );
                          });
                    }
                    else if(snapshot.connectionState == ConnectionState.waiting){
                      return Center(child: Text("Loading One...."),);
                    }
                    else if(snapshot.hasError){
                      print(snapshot.error.toString());
                      print(snapshot.hasError.toString());
                      return Center(child: Text(snapshot.error.toString()),);
                    }
                    else{
                      return Center(child: Text("Loading..."),);
                    }
                  },
                ) ,
            ),
          ],
        ),
      ),
    );
  }
}