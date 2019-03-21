import 'package:flutter/material.dart';

import 'package:sandbox/main.dart';
import 'package:sandbox/shared/logo.dart';
import 'package:sandbox/shared/button.dart';

class LoginPage extends StatefulWidget {
  final AssetImage bg;

  const LoginPage({Key key, @required this.bg}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _status = 'no-action';

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          padding: const EdgeInsets.only(bottom: 80),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: widget.bg,
              fit: BoxFit.cover,
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(.5), BlendMode.darken),
            ),
          ),
          child: Center(
              child: Column(
            children: [
              Logo(),
              _warning(),
              _loginButton(),
              _help(),
              _information(),
            ],
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
          )),
        ),
      );

  Widget _warning() => Container(
        margin: const EdgeInsets.only(top: 80),
        child: Column(
          children: [
            Text('By tapping Log in, you agree to our',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w100,
                )),
            Container(
              margin: const EdgeInsets.only(top: 5),
            ),
            Text('Terms and Privacy Policy',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w100,
                ))
          ],
        ),
      );

  Widget _help() => Container(
      margin: const EdgeInsets.only(top: 40),
      child: Text(
        'Trouble Logging In?',
        style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
            decoration: TextDecoration.underline),
      ));

  Widget _information() => Container(
      margin: const EdgeInsets.only(top: 40),
      child: Text('We don\'t post anything on Facebook',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          )));

  Widget _loginButton() {
    String _text = 'Log in';
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
        _buttonStyle = Colors.white;
    }

    return Button(
        text: _text,
        textColor: _buttonStyle,
        fontSize: 18,
        fontWeight: FontWeight.w700,
        borderColor: _buttonStyle,
        onPressed: () {
          setState(() => this._status = 'loading');
          appAuth.login().then((result) {
            if (result) {
              Navigator.of(context).pushReplacementNamed('/home');
            } else {
              setState(() => this._status = 'rejected');
            }
          });
        });
  }
}
