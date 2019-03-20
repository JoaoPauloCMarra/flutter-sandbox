import 'package:sandbox/main.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _status = 'no-action';

  @override
  Widget build(BuildContext context) => new Scaffold(
        appBar: new AppBar(
          title: new Text('Home'),
        ),
        body: new Container(
          margin: new EdgeInsets.only(top: 50.0),
          alignment: Alignment.center,
          child: new Column(
            children: <Widget>[
              new Text('Welcome to App!'),
              new FlatButton(
                  child: new Text('Logout (${this._status})'),
                  onPressed: () {
                    setState(() => this._status = 'loading');

                    appAuth.logout().then((_) =>
                        Navigator.of(context).pushReplacementNamed('/login'));
                  })
            ],
          ),
        ),
      );
}
