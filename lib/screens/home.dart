import 'package:flutter/material.dart';

import 'package:MySocial/main.dart';
import 'package:MySocial/shared/button.dart';

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

  Widget _logoutButton() {
    String _text = 'Log out';
    Color _buttonStyle;

    switch (this._status) {
      case 'loading':
        _text = 'wait...';
        _buttonStyle = Colors.grey;
        break;
      case 'rejected':
        _text = 'Rejected! Try again';
        _buttonStyle = Colors.red;
        break;
      default:
        _buttonStyle = Colors.black;
    }

    return Button(
        text: _text,
        textColor: _buttonStyle,
        fontSize: 18,
        fontWeight: FontWeight.w700,
        borderColor: _buttonStyle,
        onPressed: () {
          setState(() => this._status = 'loading');
          appAuth.logout().then((result) {
            Navigator.of(context).pushReplacementNamed('/login');
          });
        });
  }
}
