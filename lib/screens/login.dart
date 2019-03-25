import 'package:flutter/material.dart';

import 'package:MySocial/main.dart';
import 'package:MySocial/utils.dart';
import 'package:MySocial/shared/logo.dart';
import 'package:MySocial/shared/button.dart';
import 'package:MySocial/shared/link.dart';
import 'package:MySocial/shared/modal-full.dart';

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
          padding: const EdgeInsets.only(bottom: 80, left: 20, right: 20),
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

  Widget _warning() {
    final textStyle = TextStyle(
      color: Colors.white,
      fontSize: screenAwareSize(14, context),
      fontWeight: FontWeight.w100,
    );
    return Container(
      margin: const EdgeInsets.only(top: 80),
      child: Column(
        children: [
          Text('By tapping Log in, you agree to our', style: textStyle),
          Container(
            margin: const EdgeInsets.only(top: 5),
          ),
          Row(
            children: [
              Link(
                  text: 'Terms',
                  textStyle: textStyle,
                  target: 'https://www.google.com/search?q=Terms'),
              Text(
                ' and ',
                style: textStyle,
              ),
              Link(
                  text: 'Privacy Policy',
                  textStyle: textStyle,
                  target: 'https://www.google.com/search?q=Privacy+Policy'),
            ],
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ],
      ),
    );
  }

  Widget _help() => Container(
      margin: const EdgeInsets.only(top: 40),
      child: Link(
          text: 'Trouble Logging In?',
          target: 'https://www.google.com/search?q=login+not+working',
          textStyle: TextStyle(
            color: Colors.white,
            fontSize: screenAwareSize(14, context),
            fontWeight: FontWeight.w100,
          )));

  Widget _information() => Container(
      margin: const EdgeInsets.only(top: 40),
      child: FlatButton(
        textColor: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'We don\'t post anything on Facebook',
              style: TextStyle(
                fontSize: screenAwareSize(12, context),
                fontWeight: FontWeight.normal,
              ),
            ),
            Icon(Icons.keyboard_arrow_up)
          ],
        ),
        onPressed: () => _showOverlay(context),
      ));

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
        fontSize: screenAwareSize(16, context),
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

  void _showOverlay(BuildContext context) {
    final TextStyle textStyle = TextStyle(
      color: Colors.grey[850],
      fontSize: screenAwareSize(14, context),
      fontWeight: FontWeight.normal,
    );
    final String text =
        ''' Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. ''';

    Navigator.of(context).push(ShowModal(
        title: 'My sample modal :)',
        child: Column(
          children: <Widget>[
            Text(
              text,
              style: textStyle,
            ),
            Text(
              text,
              style: textStyle,
            ),
            Text(
              text,
              style: textStyle,
            ),
            Text(
              text,
              style: textStyle,
            )
          ],
        )));
  }
}
