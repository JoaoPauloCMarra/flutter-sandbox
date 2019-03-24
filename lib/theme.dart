import 'package:flutter/material.dart';

import 'package:MySocial/utils.dart';

class ModalConfig {
  BuildContext context;

  ModalConfig(BuildContext context) {
    this.context = context;
  }

  Color backgroundColor() => Colors.white.withOpacity(0.9);

  TextStyle titleStyle() => TextStyle(
      color: Colors.grey[900], fontSize: screenAwareSize(26, context));

  TextAlign titleAlign() => TextAlign.center;

  Color buttonColorPrimary() => Colors.black;

  Color buttonColorSecondary() => Colors.grey;

  double buttonFontSize() => screenAwareSize(16, context);
}
