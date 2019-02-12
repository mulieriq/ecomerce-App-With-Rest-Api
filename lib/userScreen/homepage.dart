import 'package:ecommerceapp/userScreen/aboutUs.dart';
import 'package:ecommerceapp/userScreen/cart.dart';
import 'package:ecommerceapp/userScreen/deliveryAddress.dart';
import 'package:ecommerceapp/userScreen/favoritesPage.dart';
import 'package:ecommerceapp/userScreen/itemdetails.dart';
import 'package:ecommerceapp/userScreen/login.dart';
import 'package:ecommerceapp/userScreen/messagesPage.dart';
import 'package:ecommerceapp/userScreen/notifications.dart';
import 'package:ecommerceapp/userScreen/orderHistory.dart';
import 'package:ecommerceapp/tools/store.dart';
import 'package:ecommerceapp/userScreen/profileSettings.dart';
import 'package:ecommerceapp/userScreen/restapiScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(
          'SlayUon',
          style: TextStyle(
              fontFamily: 'AlexBrush',
              fontWeight: FontWeight.w500,
              fontSize: 50.0),
        ),
        centerTitle: true,
        actions: <Widget>[
          new IconButton(
            onPressed: () => Navigator.of(context).push(
                new CupertinoPageRoute(builder: (context) => Favorites())),
            icon: Icon(Icons.favorite),
            color: Colors.white,
          ),
          Stack(
            alignment: Alignment.topLeft,
            children: <Widget>[
              new IconButton(
                onPressed: () => Navigator.of(context).push(
                    new CupertinoPageRoute(builder: (context) => Messages())),
                icon: Icon(Icons.chat),
                color: Colors.white,
              ),
              new CircleAvatar(
                radius: 8.0,
                backgroundColor: Colors.red,
                child: new Text(
                  '0',
                  style: new TextStyle(color: Colors.white, fontSize: 10.0),
                ),
              )
            ],
          ),
        ],
      ),
      body: new Column(
        children: <Widget>[
          new Flexible(
            flex: 4,
            child: GridView.builder(
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                ),
                itemCount: storeData.length,
                itemBuilder: (context, i) => new GestureDetector(
                      onLongPress: () {
                        return showDialog(
                            context: context,
                            child: Center(
                              child: new Container(
                                height: 200.0,
                                width: 300.0,
                                child: new Stack(
                                  fit: StackFit.expand,
                                  alignment: FractionalOffset.bottomCenter,
                                  children: <Widget>[
                                    new Card(
                                      color: Colors.white,
                                      child: new Image.network(
                                        storeData[i].itemImage,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ));
                      },
                      onTap: () =>
                          Navigator.of(context).push(new CupertinoPageRoute(
                              builder: (context) => ItemDetails(
                                    itemImage: storeData[i].itemImage,
                                    itemName: storeData[i].itemName,
                                    itemPrice: storeData[i].itemPrice,
                                    itemRating: storeData[i].itemRating,
                                  ))),
                      child: Card(
                        child: Stack(
                          alignment: FractionalOffset.topLeft,
                          children: <Widget>[
                            new Stack(
                              alignment: FractionalOffset.bottomCenter,
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              storeData[i].itemImage),
                                          fit: BoxFit.fitWidth)),
                                ),
                                Container(
                                  color: Colors.black.withAlpha(100),
                                  height: 30.0,
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: new Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          "${storeData[i].itemName.substring(0, 8)}...",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          "${storeData[i].itemPrice}",
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.w700),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: new Radius.circular(5.0),
                                          bottomRight: Radius.circular(5.0))),
                                  width: 60.0,
                                  height: 30.0,
                                  // color: Colors.black,
                                  child: new Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      new Icon(
                                        Icons.star,
                                        color: Colors.blue,
                                        size: 20.0,
                                      ),
                                      new Text(
                                        "${storeData[i].itemRating}",
                                        style: TextStyle(color: Colors.black),
                                      )
                                    ],
                                  ),
                                ),
                                Icon(
                                  Icons.favorite_border,
                                  color: Colors.blue,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )),
          )
        ],
      ),
      floatingActionButton: Stack(
        alignment: Alignment.topLeft,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () => Navigator.of(context)
                .push(new CupertinoPageRoute(builder: (context) => Cart())),
            child: Icon(Icons.shopping_cart),
          ),
          CircleAvatar(
            radius: 8.0,
            backgroundColor: Colors.red,
            child: new Text(
              '0',
              style: new TextStyle(fontSize: 8.0),
            ),
          )
        ],
      ),
    endDrawer: new Drawer(
       child: new Column( children: <Widget>[
          UserAccountsDrawerHeader(
             accountEmail: Text("rootlee.com"),
          )
       ],),
    )
    ,
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text('Root Lee'),
              accountEmail: new Text('info@skylab.co.ke'),
              currentAccountPicture: GestureDetector(
                onTap: () {
                  return showDialog(
                      context: context,
                      child: new Center(
                        child: Container(
                          height: 200.0,
                          width: 300.0,
                          child: Hero(
                            tag: 1.0,
                            child: new Card(
                              clipBehavior: Clip.hardEdge,
                              child: Image.network(
                                "http://resources.phrasemix.com/img/full/2015-03-17-Beach.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ));
                },
                child: Hero(
                  tag: 1.0,
                  child: new CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(
                      "http://resources.phrasemix.com/img/full/2015-03-17-Beach.jpg",
                    ),
                  ),
                ),
              ),
            ),
            new ListTile(
              onTap: () => Navigator.of(context).push(new CupertinoPageRoute(
                  builder: (context) => Notifications())),
              leading: new CircleAvatar(
                child: Icon(Icons.notifications),
                backgroundColor: Colors.white,
              ),
              title: new Text('Order Notification'),
            ),
            new ListTile(
              onTap: () => Navigator.of(context).push(
                  new CupertinoPageRoute(builder: (context) => OrderHistory())),
              leading: new CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.history),
              ),
              title: new Text(' Order History'),
            ),
            Divider(),
            new ListTile(
              onTap: () => Navigator.of(context).push(new CupertinoPageRoute(
                  builder: (context) => ProfileSettings())),
              leading: new CircleAvatar(
                child: Icon(Icons.person),
                backgroundColor: Colors.white,
              ),
              title: new Text('Profile Setting'),
            ),
            new ListTile(
              onTap: () => Navigator.of(context).push(new CupertinoPageRoute(
                  builder: (context) => DeliveryAddress())),
              leading: new CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.home),
              ),
              title: new Text(' Delivery Address'),
            ),
            new Divider(),
            new ListTile(
              onTap: () => Navigator.of(context).push(
                  new CupertinoPageRoute(builder: (context) => AboutUs())),
              trailing: new CircleAvatar(
                child: Icon(Icons.help),
                backgroundColor: Colors.white,
              ),
              title: new Text('About Us'),
            ),
            new ListTile(
              onTap: () => Navigator.of(context)
                  .push(new CupertinoPageRoute(builder: (context) => Login())),
              trailing: new CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.exit_to_app),
              ),
              title: new Text(' Login'),
            ),
            new ListTile(
              onTap: () => Navigator.of(context).push(
                  new CupertinoPageRoute(builder: (context) => RestApiHome())),
              trailing: new CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.dashboard),
              ),
              title: new Text(' Rest Api Data'),
            ),
          ],
        ),
      ),
    );
  }
}
