import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/home.dart';
import 'screens/login.dart';
import 'auth.dart';

AuthService appAuth = new AuthService();

AssetImage _bgIndex() {
  final int bgIndex = new Random().nextInt(5) + 1;
  return AssetImage('images/bg$bgIndex.jpg');
}

void main() async {
  Widget _defaultHome = new LoginPage(bg: _bgIndex());

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.blue, // navigation bar color
    statusBarColor: Colors.pink, // status bar color
  ));

  bool _result = await appAuth.login();
  if (_result) {
    _defaultHome = new HomePage();
  }

  runApp(new MaterialApp(
    title: 'App',
    home: _defaultHome,
    theme: ThemeData(fontFamily: 'Proxima Nova', primaryColor: Colors.black),
    routes: <String, WidgetBuilder>{
      '/home': (BuildContext context) => new HomePage(),
      '/login': (BuildContext context) => new LoginPage(bg: _bgIndex())
    },
  ));
}
