import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  Menu({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    final dynamic args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Hi ${args["name"]} :)",
                  style: TextStyle(fontSize: 20),
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Text("Glad to see you again"),
                Padding(padding: EdgeInsets.only(bottom: 100)),
                FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/delivery');
                  },
                  color: Colors.blue,
                  child: Text(
                    "Make new Order",
                  ),
                ),
                FlatButton(
                  onPressed: () {},
                  color: Colors.blue,
                  child: Text(
                    "Order history",
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
