import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:platty/src/widgets/platform.dart';

class PBackButton extends PlatformAdaptingWidget {
  /// Color to set. Required on iOS, on Android it is the [IconThemeData.color].
  final Color color;

  /// An override callback to perform instead of the default behavior which is
  /// to pop the [Navigator].
  ///
  /// It can, for instance, be used to pop the platform's navigation stack
  /// via [SystemNavigator] instead of Flutter's [Navigator] in add-to-app
  /// situations.
  ///
  /// Defaults to null.
  final VoidCallback onPressed;

  PBackButton(
      {Key key,
      @required this.color,
      this.onPressed,
      TargetPlatform renderPlatform})
      : super(key: key, renderPlatform: renderPlatform);

  @override
  get renderMaterial => (BuildContext context) {
        return BackButton(
          color: color,
          onPressed: onPressed,
        );
      };

  @override
  get renderCupertino => (BuildContext context) {
        return CupertinoNavigationBarBackButton(
          color: color,
          onPressed: onPressed,
        );
      };
}
