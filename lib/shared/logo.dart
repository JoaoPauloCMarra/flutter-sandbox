import 'package:flutter/material.dart';

import 'package:MySocial/utils.dart';

class Logo extends StatelessWidget {
  final IconData icon;
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color textColor;

  const Logo({
    Key key,
    this.icon = Icons.person_add,
    this.text = "MySocial",
    this.fontSize,
    this.fontWeight = FontWeight.w700,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Icon(
            icon,
            color: textColor,
            size: fontSize != null ? fontSize : screenAwareSize(26, context),
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
          ),
          Text(
            this.text,
            style: TextStyle(
              color: textColor,
              fontSize:
                  fontSize != null ? fontSize : screenAwareSize(26, context),
              fontWeight: fontWeight,
            ),
          )
        ],
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
      );
}
