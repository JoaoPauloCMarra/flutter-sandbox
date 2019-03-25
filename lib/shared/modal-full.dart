import 'package:flutter/material.dart';

import 'package:MySocial/theme.dart';
import 'button.dart';

ModalConfig config;

class ShowModal extends ModalRoute<void> {
  @override
  Duration get transitionDuration => Duration(milliseconds: 400);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.5);

  @override
  String get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    config = ModalConfig(context);
    return Material(
      type: MaterialType.transparency,
      child: _buildOverlayContent(context),
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) =>
      FadeTransition(
        opacity: animation,
        child: ScaleTransition(
          scale: animation,
          child: child,
        ),
      );

  String title;
  Widget child;
  Function onConfirm;

  ShowModal({
    this.title = '',
    this.child = const Text(' '),
    this.onConfirm,
  });

  Widget _buildOverlayContent(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(config.containerPadding()),
        decoration: BoxDecoration(
          color: config.backgroundColor(),
        ),
        child: SafeArea(
            child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _title(context),
              Container(
                margin: EdgeInsets.only(bottom: config.titleMarginBottom()),
              ),
              Expanded(
                  child: ListView(
                shrinkWrap: true,
                children: [child],
              )),
              Container(
                margin: EdgeInsets.only(bottom: config.contentMarginBottom()),
              ),
              _actions(context)
            ],
          ),
        )));
  }

  Widget _title(BuildContext context) => title != null
      ? Text(
          title,
          textAlign: config.titleAlign(),
          style: config.titleStyle(),
        )
      : null;

  Widget _actions(BuildContext context) {
    var actions = <Widget>[];

    if (onConfirm != null) {
      actions.add(Button(
        text: 'Confirm',
        fontSize: config.buttonFontSize(),
        borderColor: config.buttonColorConfirm(),
        textColor: config.buttonColorConfirm(),
        onPressed: () => onConfirm(),
      ));
    }
    actions.add(Button(
      text: 'Close',
      fontSize: config.buttonFontSize(),
      borderColor: config.buttonColorCancel(),
      textColor: config.buttonColorCancel(),
      onPressed: () => Navigator.pop(context),
    ));

    return Column(
      children: actions,
    );
  }
}
