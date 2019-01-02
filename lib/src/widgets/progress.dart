import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'platform.dart';

class PActivityIndicator extends PlatformAdaptingWidget {
  final Animation<Color> androidValueColor;
  final double androidStrokeWidth;

  final bool iosAnimating;
  final double iosRadius;

  PActivityIndicator(
      {Key key,
      this.androidValueColor,
      this.androidStrokeWidth,
      this.iosAnimating = true,
      this.iosRadius = 10.0,
      TargetPlatform renderPlatform})
      : super(key: key, renderPlatform: renderPlatform);

  @override
  get renderMaterial => (BuildContext context) {
        return CircularProgressIndicator(
          key: key,
          valueColor: androidValueColor,
        );
      };

  @override
  get renderCupertino => (BuildContext context) {
        return CupertinoActivityIndicator(
          key: key,
          animating: iosAnimating,
          radius: iosRadius,
        );
      };
}
