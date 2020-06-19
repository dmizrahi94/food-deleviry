import 'package:flutter/material.dart' ;
import '../data/resureants.dart' as data ;
class Delivery extends StatefulWidget {
  Delivery({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _DeliveryState createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
  String resturant ;
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
          title: Text(widget.title),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                DropdownButton<String>(
                  value: resturant,
                  hint: Text('Select resturan'),
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.blueGrey),
                  underline: Container(
                    height: 2,
                    color: Colors.blueGrey,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      resturant = newValue;
                       data.resturants.forEach((f){
                         if(f["name"] == newValue){
                           resturantData = f;
                         }
                      });
                    });
                  },
                  items: data.resturants.map<DropdownMenuItem<String>>((res){
                 return DropdownMenuItem<String>(
                      value: res["name"].toString(),
                      child: Text(res["name"]),
                    );
                  }).toList()
                ),
              this.resturant != null ? Column( children: resturantData["menu"].map<Widget>((m){
                return Padding(padding:EdgeInsets.symmetric(vertical: 10, ) , child:  Row(children: <Widget>[
                  Center(child: Text('${m["name"]}...........')),
                  Center(child: Text(m["price"].toString())),
                  Padding(padding:EdgeInsets.symmetric( horizontal: 20), child: 
                  SizedBox(width: 15 ,height: 15, child:  FloatingActionButton(
                    heroTag: null,
                    child: Icon(Icons.add, size: 10,),onPressed: (){
                    setState(() {
                    order.add(m);
                    total += m["price"];
                    });
                  },)))
                ]));
              }).toList(),): null,
              this.resturant != null ? 
              Center (child: Padding(padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),child: Text('Total $total')))
              : null,
                Padding(padding:EdgeInsets.symmetric(vertical: 20, horizontal: 30)),
                  Center(child: FlatButton( 
                  color: Colors.blue,
                  child: Text("Payment"),    
                  onPressed: () {
                    Navigator.pushNamed(context, '/location');
                  }))
              ].where((w) => w != null).toList(),
            ),
          ),
        ));
  }
}
