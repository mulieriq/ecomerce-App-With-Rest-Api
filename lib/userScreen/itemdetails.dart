import 'package:ecommerceapp/userScreen/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ItemDetails extends StatefulWidget {
  String itemName;
  double itemPrice;
  String itemImage;
  double itemRating;

  ItemDetails({this.itemImage, this.itemName, this.itemPrice, this.itemRating});

  @override
  _ItemDetailsState createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    Size screeSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Item Details'),
        centerTitle: false,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: new Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Container(
            height: 300,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(widget.itemImage),
                    fit: BoxFit.fitHeight),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(120.0),
                    bottomLeft: Radius.circular(120.0))),
          ),
          Container(
            height: 300,
            decoration: BoxDecoration(
                color: Colors.grey.withAlpha(50),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(120.0),
                    bottomLeft: Radius.circular(120.0))),
          ),
          new SingleChildScrollView(
            child: new Column(
              children: <Widget>[
                SizedBox(
                  height: 50.0,
                ),
                new Card(
                    child: new Container(
                  width: screeSize.width,
                  margin: EdgeInsets.only(right: 20.0, left: 20.0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 10.0,
                      ),
                      new Text(
                        widget.itemName,
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      new Text(
                        'Item Sub Name',
                        style: TextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              new Icon(
                                Icons.star,
                                color: Colors.blue,
                                size: 20.0,
                              ),
                              new Text("${widget.itemRating}")
                            ],
                          ),
                          new Text(
                            "${widget.itemPrice}",
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),
                )),
                new Card(
                  child: new Container(
                    height: 150.0,
                    width: screeSize.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, i) => Stack(
                            children: <Widget>[
                              Container(
                                height: 140.0,
                                width: 100.0,
                                margin: EdgeInsets.only(right: 5.0, left: 5.0),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(widget.itemImage),
                                        fit: BoxFit.fitHeight)),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 5.0, right: 5.0),
                                height: 140.0,
                                width: 100.0,
                                decoration: BoxDecoration(
                                    color: Colors.grey.withAlpha(50)),
                              )
                            ],
                          ),
                    ),
                  ),
                ),
                new Card(
                    child: new Container(
                  width: screeSize.width,
                  margin: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 10.0,
                      ),
                      new Text(
                        "Description",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 14.0),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      new Text(
                        "Full Item Information",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 10.0),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),
                )),
                Card(
                  child: Container(
                    width: screeSize.width,
                    margin: EdgeInsets.only(right: 20.0, left: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 10.0,
                        ),
                        new Text(
                          'Colors',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        SizedBox(
                          height: 50.0,
                          child: ListView.builder(
                              itemCount: 5,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, i) => Padding(
                                    padding: EdgeInsets.all(1.5),
                                    child: ChoiceChip(
                                      label: new Text('Color'),
                                      selected: false,
                                    ),
                                  )),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        new Text(
                          'Sizes',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        SizedBox(
                          height: 50.0,
                          child: ListView.builder(
                              itemCount: 5,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, i) => Padding(
                                    padding: EdgeInsets.all(1.5),
                                    child: ChoiceChip(
                                      label: new Text('Color'),
                                      selected: false,
                                    ),
                                  )),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        new Text(
                          ' Custom Sizes',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor: Theme.of(context).primaryColor,
                              child: Icon(Icons.add),
                            ),
                            new Text('0'),
                            CircleAvatar(
                              backgroundColor: Theme.of(context).primaryColor,
                              child: Icon(Icons.remove),
                            ),
                          ],
                        ),  SizedBox(
                          height: 15.0,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: new BottomAppBar(
        color: Theme.of(context).primaryColor,
        elevation: 7.0,
        notchMargin: 5.0,
        shape: new CircularNotchedRectangle(),
        clipBehavior: Clip.hardEdge,
        child: new Container(
          height: 50.0,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
          ),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 30.0),
                child: new Container(
                  child: new Text(
                    ' Add To Favorite',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 50.0),
                child: new Container(
                  child: new Text(
                    ' Order Now',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
