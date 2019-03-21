import 'package:sandbox/main.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _status = 'no-action';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: _appBar(),
        body: Container(
          margin: EdgeInsets.only(top: 50),
          alignment: Alignment.center,
          child: Column(
            children: [_welcome(), _logoutButton()],
          ),
        ),
      );

  Widget _appBar() => AppBar(
        title: Text('Landing...'),
      );

  Widget _welcome() => Text('Welcome to MySocial!');

  Widget _logoutButton() => FlatButton(
      child: Text('Logout (${this._status})'),
      onPressed: () {
        setState(() => this._status = 'loading');

        appAuth
            .logout()
            .then((_) => Navigator.of(context).pushReplacementNamed('/login'));
      });
}
