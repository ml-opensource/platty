import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:platty/src/widgets/platform.dart';

class PBackButton extends PlatformAdaptingWidget {
  /// Color to set. Required on iOS, on Android it is the [IconThemeData.color].
  final Color color;

  PBackButton({Key key, @required this.color, TargetPlatform renderPlatform})
      : super(key: key, renderPlatform: renderPlatform);

  @override
  get renderMaterial => (BuildContext context) {
        return BackButton(
          color: color,
        );
      };

  @override
  get renderCupertino => (BuildContext context) {
        return CupertinoNavigationBarBackButton(
          color: color,
        );
      };
}
