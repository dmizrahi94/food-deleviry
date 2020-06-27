import 'package:flutter/material.dart';

class Order extends StatefulWidget {
  Order({Key key}) : super(key: key);
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  String resturant;
  dynamic resturantData;
  int total;
  List order;

  @override
  void initState() {
    super.initState();
    order = [];
    total = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Done"),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text("your order is on the way ...", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                ),
                Image(
                  image: AssetImage("lib/images/delivery.jpg"),
                  width: 300,
                  height: 300,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/menu');
                  },
                  color: Colors.blue,
                  child: Text(
                    "OK",
                  ),
                )
              ].where((w) => w != null).toList(),
            ),
          ),
        ));
  }
}
