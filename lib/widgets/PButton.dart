import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:platty/widgets/PlatformAdaptingWidget.dart';

/// A Platform-Specific Button that conforms to iOS and Android as appropriate.
class PButton extends PlatformAdaptingWidget {
  final Widget child;
  final VoidCallback onPressed;
  final Color color;
  final Color disabledColor;
  final EdgeInsets padding;
  final ShapeBorder androidShape;
  final BorderRadius iosBorderRadius;

  const PButton(
      {Key key,
      @required this.child,
      @required this.onPressed,
      this.color,
      this.disabledColor,
      this.padding,
      this.androidShape,
      this.iosBorderRadius})
      : super(key: key);

  get renderMaterial => () {
        return RaisedButton(
          child: child,
          onPressed: onPressed,
          color: color,
          disabledColor: disabledColor,
          padding: padding,
          shape: androidShape,
        );
      };

  get renderCupertino => () {
        return CupertinoButton(
          child: child,
          onPressed: onPressed,
          color: color,
          disabledColor: disabledColor,
          padding: padding,
          borderRadius: iosBorderRadius,
        );
      };
}
