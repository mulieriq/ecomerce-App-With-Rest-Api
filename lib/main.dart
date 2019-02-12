import 'package:ecommerceapp/userScreen/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UoN Girlies' ,
      theme: new ThemeData(primarySwatch: Colors.deepPurple),
      home: new HomePage(),
      routes: {
           
          
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
