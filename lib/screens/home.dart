import 'package:flutter/material.dart';

import 'package:MySocial/main.dart';
import 'package:MySocial/utils.dart';
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
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.only(top: 50),
            alignment: Alignment.center,
            child: ListView(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 50),
              shrinkWrap: true,
              children: [
                _welcome(),
                Container(margin: EdgeInsets.only(top: 20)),
                _homeText(),
                Container(margin: EdgeInsets.only(top: 20)),
                _homeText(),
                Container(margin: EdgeInsets.only(top: 20)),
                _homeText(),
                Container(margin: EdgeInsets.only(top: 20)),
                _homeText(),
                Container(margin: EdgeInsets.only(top: 20)),
                _homeText(),
                Container(margin: EdgeInsets.only(bottom: 50)),
                _logoutButton(),
              ],
            ),
          ),
        ),
      );

  Widget _appBar() => AppBar(
        title: Text('You are authenticated!'),
      );

  Widget _welcome() => Text(
        'Welcome to MySocial!',
        style: TextStyle(
            color: Colors.grey[900],
            fontWeight: FontWeight.w700,
            fontSize: screenAwareSize(22, context)),
      );

  Widget _homeText() => Text(
        '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.''',
        textAlign: TextAlign.justify,
        style: TextStyle(
            color: Colors.grey[800],
            fontWeight: FontWeight.normal,
            fontSize: screenAwareSize(14, context)),
      );

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
        fontSize: screenAwareSize(16, context),
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
