import 'package:flutter/material.dart';

import 'package:MySocial/theme.dart';
import 'package:MySocial/main.dart';
import 'package:MySocial/utils.dart';
import 'package:MySocial/shared/button.dart';

MainTheme theme;

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _status = 'no-action';

  @override
  Widget build(BuildContext context) {
    theme = MainTheme(context);
    return Scaffold(
      backgroundColor: Colors.white,
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
  }

  Widget _appBar() => AppBar(
        title: Text('You are authenticated!'),
      );

  Widget _welcome() => Text(
        'Welcome to MySocial!',
        style: theme.getTheme().textTheme.title,
      );

  Widget _homeText() => Text(
        '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.''',
        textAlign: TextAlign.justify,
        style: theme.getTheme().textTheme.body1,
      );

  Widget _logoutButton() => Button(
      text: 'Log out',
      textColor: Colors.redAccent,
      fontSize: screenAwareSize(14, context),
      fontWeight: FontWeight.normal,
      borderColor: Colors.redAccent,
      onPressed: () {
        setState(() => this._status = 'loading');
        appAuth.logout().then((result) {
          Navigator.of(context).pushReplacementNamed('/login');
        });
      });
}
