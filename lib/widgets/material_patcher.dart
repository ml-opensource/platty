import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// Useful helper class that checks if we have material ancestor. If we don't,
/// we wrap the widget in a [Material] object.
class MaterialPatcher extends StatelessWidget {
  final Widget child;

  /// See [Material.type]
  final MaterialType type;

  /// See [Material.elevation]
  final double elevation;

  /// See [Material.color]
  final Color color;

  /// See [Material.shadowColor]
  final Color shadowColor;

  /// See [Material.textStyle]
  final TextStyle textStyle;

  /// See [Material.borderRadius]
  final BorderRadius borderRadius;

  /// See [Material.shape]
  final ShapeBorder shape;

  /// See [Material.clipBehavior]
  final Clip clipBehavior;

  /// See [Material.animationDuration]
  final Duration animationDuration;

  const MaterialPatcher({
    Key key,
    @required this.child,
    this.type = MaterialType.canvas,
    this.elevation = 0.0,
    this.color,
    this.shadowColor = const Color(0xFF000000),
    this.textStyle,
    this.borderRadius,
    this.shape,
    this.clipBehavior = Clip.none,
    this.animationDuration = kThemeChangeDuration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final material = context.ancestorWidgetOfExactType(Material);
    // patch for rendering widget without material
    if (material == null) {
      debugPrint("Patching child $child with material.");
      return Material(
        child: child,
        type: type,
        elevation: elevation,
        color: color,
        shadowColor: shadowColor,
        textStyle: textStyle,
        borderRadius: borderRadius,
        shape: shape,
        clipBehavior: clipBehavior,
        animationDuration: animationDuration,
      );
    } else {
      return child;
    }
  }
}
