import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Link extends StatelessWidget {
  final String text;
  final String target;
  final TextStyle textStyle;
  final TextStyle defaultTextStyle = const TextStyle(
      color: Colors.white,
      decoration: TextDecoration.underline,
      fontWeight: FontWeight.w700);

  const Link({
    Key key,
    this.text = "link",
    this.target,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
        child: Text(
          text,
          style: target != null ? textStyle.merge(defaultTextStyle) : textStyle,
        ),
        onTap: target != null ? _launchURL : null,
      );

  _launchURL() async {
    if (await canLaunch(target)) {
      await launch(target);
    } else {
      throw 'Could not launch $target';
    }
  }
}
