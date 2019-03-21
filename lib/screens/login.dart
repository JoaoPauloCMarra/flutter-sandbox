import 'package:sandbox/main.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final AssetImage bg;

  const LoginPage({Key key, @required this.bg}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _status = 'no-action';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: widget.bg,
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(.4), BlendMode.darken),
          ),
        ),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Logo(),
            Warning(),
            LoginButton(
              status: this._status,
              updateStatus: (nextStatus) =>
                  setState(() => this._status = nextStatus),
            ),
            Help(),
            Information(),
          ],
        )),
      ),
    );
  }
}

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(
      'MySocial',
      style: TextStyle(
        color: Colors.white,
        fontSize: 32,
        fontWeight: FontWeight.w700,
      ),
    ));
  }
}

class Warning extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
  }
}

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 40),
        child: Text(
          'Trouble Logging In?',
          style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.underline),
        ));
  }
}

class Information extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 40),
        child: Text('We don\'t post anything on Facebook',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.normal,
            )));
  }
}

class LoginButton extends StatelessWidget {
  final String status;
  final Function updateStatus;

  const LoginButton({Key key, this.status, this.updateStatus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: new BorderRadius.circular(25.0),
            border: new Border.all(color: Colors.white, width: 1)),
        child: FlatButton(
            child: Text('Log in (${this.status})',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                )),
            textColor: Colors.white,
            padding: const EdgeInsets.only(left: 50, right: 50),
            onPressed: () {
              this.updateStatus('loading');

              if (this.status != 'loading') {
                appAuth.login().then((result) {
                  if (result) {
                    Navigator.of(context).pushReplacementNamed('/home');
                  } else {
                    this.updateStatus('rejected');
                  }
                });
              }
            }));
  }
}
