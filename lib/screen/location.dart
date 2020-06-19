import 'package:flutter/material.dart' ;
class Location extends StatefulWidget {
  Location() : super();
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Where are you ?"),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                       TextField(
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Address',
                  ),
                ), 
                 Padding(padding: EdgeInsets.only(bottom: 10)),
                 Center(child: FlatButton( 
                  color: Colors.blue,
                  child: Text(" See Loction"),    
                  onPressed: () {
                    Navigator.pushNamed(context, '/map');
                  })),
                 Padding(padding: EdgeInsets.only(bottom: 10)),
                 Center(child: FlatButton( 
                  color: Colors.blue,
                  child: Text("Payment"),    
                  onPressed: () {
                    Navigator.pushNamed(context, '/payment');
                  }))
              ].where((w) => w != null).toList(),
            ),
          ),
        ));
  }
}