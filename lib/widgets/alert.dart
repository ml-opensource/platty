import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platty/widgets/platform.dart';

class PAlertDialog extends PlatformAdaptingWidget {
  final Widget title;
  final Widget content;
  final List<Widget> actions;

  PAlertDialog({this.title, this.content, this.actions});

  @override
  get renderMaterial => () {
        return AlertDialog(
          title: title,
          content: content,
          actions: actions,
        );
      };

  @override
  get renderCupertino => () {
        return CupertinoAlertDialog(
          title: title,
          content: content,
          actions: actions,
        );
      };
}


