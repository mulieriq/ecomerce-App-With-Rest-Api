import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('My Favorite'),
        centerTitle: true,
      ),
    );
  }
}
