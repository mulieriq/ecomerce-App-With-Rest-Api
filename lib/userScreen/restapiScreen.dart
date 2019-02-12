import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../tools/data.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RestApiHome extends StatefulWidget {
  @override
  _RestApiHomeState createState() => _RestApiHomeState();
}

class _RestApiHomeState extends State<RestApiHome> {


var apidata;

  String url = "http://192.168.43.118:3000/developer.api/products/";
  RestApi products;
getData() async {
    var result = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    var data = jsonDecode(result.body);

    products = RestApi.fromJson(data);
    print(products.toJson());
    setState(() {
       
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
 
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Api Dashboard"),
        ),
        body: StreamBuilder<int>(
          stream: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.none) {
              return Card(
                child: new Center(
                  child: new Text(
                      "No Internet ... Please Check Your Internet Connection "),
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.connectionState == ConnectionState.done) {
              return new GridView.count(
                  crossAxisCount: 2,
                  children: snapshot.data.products
                      .map((product) => Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Stack(
                                alignment: FractionalOffset.bottomRight,
                                children: <Widget>[
                                  Stack(
                                    fit: StackFit.expand,
                                    children: <Widget>[
                                      Card(
                                        clipBehavior: Clip.hardEdge,
                                        child: Container(
                                          child: new Image.network(
                                            product.img,
                                            fit: BoxFit.cover,
                                          ),
                                          height: 100.0,
                                          width: 195.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  new Container(
                                    margin: const EdgeInsets.only(
                                        bottom: 4.0, right: 5.0),
                                    color: Colors.black.withAlpha(100),
                                    child: new Text(
                                      product.name,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )
                                ]),
                          ))
                      .toList());
            } else if (snapshot.connectionState == ConnectionState.active) {
              return new Card(
                child: new Center(
                  child: new Text("Connection Done"),
                ),
              );
            } else {
              return Card(
                child: new Center(
                  child: new Text("An Error Has Occured."),
                ),
              );
            }
          },
        )
        //  products == null
        //     ? Center(
        //         child: CircularProgressIndicator(),
        //       )
        //     : new GridView.count(
        //         crossAxisCount: 2,
        //         children: products.products
        //             .map((product) => Padding(
        //                   padding: const EdgeInsets.symmetric(horizontal: 5.0),
        //                   child: Stack(
        //                       alignment: FractionalOffset.bottomRight,
        //                       children: <Widget>[
        //                         Stack(
        //                           fit: StackFit.expand,
        //                           children: <Widget>[
        //                             Card(
        //                               clipBehavior: Clip.hardEdge,
        //                               child: Container(
        //                                 child: new Image.network(
        //                                   product.img,
        //                                   fit: BoxFit.cover,
        //                                 ),
        //                                 height: 100.0,
        //                                 width: 195.0,
        //                               ),
        //                             ),
        //                           ],
        //                         ),
        //                         new Container(
        //                           margin: const EdgeInsets.only(
        //                               bottom: 4.0, right: 5.0),
        //                           color: Colors.black.withAlpha(100),
        //                           child: new Text(
        //                             product.name,
        //                             style: TextStyle(color: Colors.white),
        //                           ),
        //                         )
        //                       ]),
        //                 ))
        //             .toList()),
        );
  }
}
