import 'package:flutter/material.dart';

import 'package:MySocial/utils.dart';

class ModalConfig {
  BuildContext context;

  ModalConfig(BuildContext context) {
    this.context = context;
  }

  Color backgroundColor() => Colors.white.withOpacity(0.9);

  double containerPadding() => 20.0;

  TextStyle titleStyle() => TextStyle(
      color: Colors.grey[900],
      fontSize: screenAwareSize(26, context),
      fontWeight: FontWeight.w700);

  TextAlign titleAlign() => TextAlign.center;

  double titleMarginBottom() => 20.0;

  double contentMarginBottom() => 10.0;

  Color buttonColorConfirm() => Colors.black;

  Color buttonColorCancel() => Colors.red[500];

  double buttonFontSize() => screenAwareSize(16, context);
}
