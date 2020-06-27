import 'package:flutter/material.dart';
import '../data/orders.dart' as orders;

class OrderHistory extends StatefulWidget {
  OrderHistory({Key key}) : super(key: key);
  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
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
          title: Text("Order History"),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                ),
                Text(
                  "Resturant | Total | Date",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                ),
                Column(
                  children: orders.orders
                      .map((order) => Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("${order["resturant"]} | "),
                              Text("${order["total"].toString()} NIS | "),
                              Text(order["orderTime"])
                            ],
                          )))
                      .toList(),
                ),
              ].where((w) => w != null).toList(),
            ),
          ),
        ));
  }
}
