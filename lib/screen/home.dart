import 'package:flutter/material.dart';
import 'package:fooddelivery/utils/db.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  bool error;

  initState() {
    super.initState();
    dbUtils.initDB();
    error = false;
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                  ),
                ),
                Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 30)),
                TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
                error == true
                    ? Padding(padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),child:  Text(
                        "User or Password not correct",
                        style: TextStyle(color: Colors.red),
                      ))
                    : null,
                FlatButton(
                  onPressed: () async {
                    var user =
                        await dbUtils.getClientByUsername(nameController.text);
                        print(user);
                    if (user == Null || user.password != passwordController.text) {
                      setState(() {
                        error = true;
                      });
                    } else {
                      Navigator.pushNamed(context, '/menu',
                          arguments: {"name": nameController.text});
                    }
                  },
                  color: Colors.blue,
                  child: Text(
                    "Login",
                  ),
                )
              ].where((w) => w != null).toList(),
            ),
          ),
        ));
  }
}
