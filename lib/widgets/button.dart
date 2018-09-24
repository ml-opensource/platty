import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:platty/widgets/platform.dart';

/// A Platform-Specific Button that conforms to iOS and Android as appropriate.
/// On Android, this is [RaisedButton]
/// On iOS, this is a [CupertinoButton]
class PButton extends PlatformAdaptingWidget {
  final Widget child;
  final VoidCallback onPressed;
  final Color color;
  final Color disabledColor;
  final EdgeInsets padding;
  final ShapeBorder androidShape;
  final BorderRadius iosBorderRadius;
  final double iosPressedOpacity;

  const PButton(
      {Key key,
      @required this.child,
      @required this.onPressed,
      this.color,
      this.disabledColor,
      this.padding,
      this.androidShape,
      this.iosBorderRadius,
      this.iosPressedOpacity = 0.1,
      TargetPlatform renderPlatform})
      : super(key: key, renderPlatform: renderPlatform);

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
          pressedOpacity: iosPressedOpacity,
        );
      };
}

/// A Platform-Specific Button that conforms to iOS and Android as appropriate.
/// On Android this is [FlatButton]
/// On iOS this is [CupertinoButton]
class PFlatButton extends PlatformAdaptingWidget {
  final Widget child;
  final VoidCallback onPressed;
  final Color color;
  final Color disabledColor;
  final EdgeInsets padding;
  final ShapeBorder androidShape;
  final BorderRadius iosBorderRadius;
  final double iosPressedOpacity;

  const PFlatButton(
      {Key key,
      @required this.child,
      @required this.onPressed,
      this.color,
      this.disabledColor,
      this.padding,
      this.androidShape,
      this.iosBorderRadius,
      this.iosPressedOpacity = 0.1,
      TargetPlatform renderPlatform})
      : super(key: key, renderPlatform: renderPlatform);

  @override
  get renderMaterial => () {
        return FlatButton(
          child: child,
          onPressed: onPressed,
          color: color,
          disabledColor: disabledColor,
          padding: padding,
          shape: androidShape,
        );
      };

  @override
  get renderCupertino => () {
        return CupertinoButton(
          child: child,
          color: color,
          onPressed: onPressed,
          disabledColor: disabledColor,
          padding: padding,
          borderRadius: iosBorderRadius,
          pressedOpacity: iosPressedOpacity,
        );
      };
}
