import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

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
    bool animate = false;
    double animationSize = 100;
    String animationFile = '';
    String animationName = '';
    String text = 'Log in';
    Color buttonStyle = Colors.white;

    switch (this._status) {
      case 'rejected':
        text = 'Rejected! Try again';
        buttonStyle = Colors.redAccent;
        break;
      case 'loading':
        animate = true;
        animationFile = "animations/loading_fingerprint.flr";
        animationName = "loop";
        break;
      case 'success':
        animate = true;
        animationFile = "animations/success_icon.flr";
        animationName = "pop";
        break;
      case 'rejected_icon':
        animate = true;
        animationFile = "animations/fail_icon.flr";
        animationName = "pop";
        break;
      default:
        text = 'Log in';
    }

    if (animate == true) {
      return Container(
        margin: EdgeInsets.only(top: 20),
        width: animationSize,
        height: animationSize,
        child: FlareActor(animationFile,
            shouldClip: false,
            animation: animationName,
            alignment: Alignment.center,
            fit: BoxFit.cover, callback: (animation) {
          switch (this._status) {
            case 'success':
              Future.delayed(const Duration(seconds: 1), () {
                Navigator.of(context).pushReplacementNamed('/home');
              });
              break;
            case 'rejected_icon':
              Future.delayed(const Duration(milliseconds: 1000), () {
                setState(() => this._status = 'rejected');
              });
              break;
            default:
              return null;
          }
        }),
      );
    }

    return Container(
      margin: EdgeInsets.only(top: 25, bottom: 25),
      width: 280,
      child: Button(
          text: text,
          textColor: buttonStyle,
          fontSize: screenAwareSize(16, context),
          fontWeight: FontWeight.w700,
          borderColor: buttonStyle,
          onPressed: () {
            setState(() => this._status = 'loading');
            appAuth.login().then((result) {
              setState(() =>
                  this._status = result == true ? 'success' : 'rejected_icon');
            });
          }),
    );
  }

  void _showOverlay(BuildContext context) {
    final TextStyle textStyle = TextStyle(
      color: Colors.grey[850],
      fontSize: screenAwareSize(14, context),
      fontWeight: FontWeight.normal,
    );
    final String loremText =
        ''' Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. ''';

    final Map<int, ModalButtonConfig> actions = Map();
    actions[0] =
        ModalButtonConfig('Confirm 1', Colors.blue, () => print('confirm 1'));
    actions[1] =
        ModalButtonConfig('Confirm 2', Colors.green, () => print('confirm 2'));

    Navigator.of(context).push(ShowModal(
        title: 'My sample modal :)',
        actions: actions,
        child: Column(
          children: <Widget>[
            Text(
              loremText,
              style: textStyle,
            ),
            Text(
              loremText,
              style: textStyle,
            ),
            Text(
              loremText,
              style: textStyle,
            ),
            Text(
              loremText,
              style: textStyle,
            )
          ],
        )));
  }
}
