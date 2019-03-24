import 'package:flutter/material.dart';

import 'package:MySocial/theme.dart';
import 'button.dart';

var config;

class ShowModal extends ModalRoute<void> {
  @override
  Duration get transitionDuration => Duration(milliseconds: 500);

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
    config = new ModalConfig(context);
    return Material(
      type: MaterialType.transparency,
      child: _buildOverlayContent(context),
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: animation,
        child: child,
      ),
    );
  }

  String title;
  Widget child;

  ShowModal({
    this.title = '',
    this.child = const Text(' '),
  });

  Widget _buildOverlayContent(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
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
                margin: const EdgeInsets.only(top: 20),
              ),
              Expanded(
                  child: ListView(
                shrinkWrap: true,
                children: [child],
              )),
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

  Button _actions(BuildContext context) => Button(
        text: 'Close',
        fontSize: config.buttonFontSize(),
        borderColor: config.buttonColorPrimary(),
        textColor: config.buttonColorPrimary(),
        onPressed: () => Navigator.pop(context),
      );
}
