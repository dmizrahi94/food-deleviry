import 'package:flutter/material.dart';
import './screen/home.dart';
import './screen/delivery.dart';
import './screen/map.dart';
import './screen/order.dart';
import './screen/payment.dart';
import './screen/location.dart';
import 'screen/menu.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Food delivery'),
        routes: <String, WidgetBuilder> {
      '/delivery': (BuildContext context) => Delivery(title: 'Delivery'),
      '/map': (BuildContext context) => Map(),
      '/order':(BuildContext context) => Order(),
      '/payment':(BuildContext context) => Payment(),
      '/location':(BuildContext context) => Location(),
      '/menu':(BuildContext context) => Menu(title: "Food Delivery",),
    },
);
  }
}


