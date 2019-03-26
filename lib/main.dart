import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'theme.dart';
import 'screens/home.dart';
import 'screens/login.dart';
import 'auth.dart';

AuthService appAuth = AuthService();

AssetImage _selectedBg() {
  final int bgIndex = Random().nextInt(5) + 1;
  return AssetImage('images/bg$bgIndex.jpg');
}

void main() async {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  Widget _defaultHome = LoginPage(bg: _selectedBg());

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black,
    statusBarColor: Colors.black,
  ));

  // Check login before decide which page is the default page
  // bool _result = await appAuth.login();
  // if (_result) {
  //   _defaultHome = HomePage();
  // }

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'MySocial',
    home: _defaultHome,
    theme: MainTheme().getTheme(),
    routes: <String, WidgetBuilder>{
      '/home': (BuildContext context) => HomePage(),
      '/login': (BuildContext context) => LoginPage(bg: _selectedBg())
    },
  ));
}
