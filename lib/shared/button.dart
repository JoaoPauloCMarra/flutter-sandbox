import 'package:flutter/material.dart';

import 'package:MySocial/utils.dart';

class Button extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color textColor;
  final double borderRadius;
  final Color borderColor;
  final double borderWidth;
  final Color backgroundColor;
  final double paddingHorizontal;
  final bool disabled;
  final Function onPressed;

  const Button({
    Key key,
    this.text = "",
    this.fontSize = 14,
    this.fontWeight = FontWeight.normal,
    this.textColor = Colors.white,
    this.borderRadius = 25,
    this.borderColor = Colors.white,
    this.borderWidth = 1,
    this.backgroundColor = Colors.transparent,
    this.paddingHorizontal = 20,
    this.disabled = false,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
      onTap: disabled ? null : onPressed,
      child: Container(
        constraints: const BoxConstraints(minWidth: double.infinity),
        margin: const EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(color: borderColor, width: borderWidth)),
        width: 250.0,
        child: Text(text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor,
              fontSize: screenAwareSize(fontSize, context),
              fontWeight: fontWeight,
            )),
        padding: EdgeInsets.only(
            left: paddingHorizontal,
            right: paddingHorizontal,
            top: paddingHorizontal / 2,
            bottom: paddingHorizontal / 2),
      ));
}
