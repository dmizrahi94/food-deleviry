import 'package:flutter/material.dart';
class Payment extends StatefulWidget {
  Payment() : super();
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Payment"),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'creadit card',
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 20)),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'cvv',
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 20)),
                TextField(
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'expiration date',
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 20)),
                Center(child: FlatButton( 
                  color: Colors.blue,
                  child: Text("Order"),    
                  onPressed: () {
                    Navigator.pushNamed(context, '/order');
                  }))
              ].where((w) => w != null).toList(),
            ),
          ),
        ));
  }
}
