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
  final double iosMinSize;

  const PButton(
      {Key key,
      @required this.child,
      @required this.onPressed,
      this.color,
      this.disabledColor,
      this.padding,
      this.androidShape,
      this.iosBorderRadius = const BorderRadius.all(Radius.circular(8.0)),
      this.iosPressedOpacity = 0.1,
      this.iosMinSize = 44.0,
      TargetPlatform renderPlatform})
      : super(key: key, renderPlatform: renderPlatform);

  get renderMaterial => (BuildContext context) {
        return RaisedButton(
          child: child,
          onPressed: onPressed,
          color: color,
          disabledColor: disabledColor,
          padding: padding,
          shape: androidShape,
        );
      };

  get renderCupertino => (BuildContext context) {
        return CupertinoButton(
          child: child,
          onPressed: onPressed,
          color: color,
          disabledColor: disabledColor,
          padding: padding,
          borderRadius: iosBorderRadius,
          pressedOpacity: iosPressedOpacity,
          minSize: iosMinSize,
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
  final double iosMinSize;

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
      this.iosMinSize = 44.0,
      TargetPlatform renderPlatform})
      : super(key: key, renderPlatform: renderPlatform);

  @override
  get renderMaterial => (BuildContext context) {
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
  get renderCupertino => (BuildContext context) {
        return CupertinoButton(
          child: child,
          color: color,
          onPressed: onPressed,
          disabledColor: disabledColor,
          padding: padding,
          borderRadius: iosBorderRadius,
          pressedOpacity: iosPressedOpacity,
          minSize: iosMinSize,
        );
      };
}
