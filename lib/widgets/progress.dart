import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'platform.dart';

class PActivityIndicator extends PlatformAdaptingWidget {
  final Color androidBackgroundColor;
  final Animation<Color> androidValueColor;
  final double androidStrokeWidth;

  final bool iosAnimating;
  final double iosRadius;

  PActivityIndicator(
      {this.androidBackgroundColor,
      this.androidValueColor,
      this.androidStrokeWidth,
      this.iosAnimating = true,
      this.iosRadius = 10.0,
      TargetPlatform renderPlatform})
      : super(renderPlatform: renderPlatform);

  @override
  get renderMaterial => () {
        return CircularProgressIndicator(
          key: key,
          backgroundColor: androidBackgroundColor,
          valueColor: androidValueColor,
        );
      };

  @override
  get renderCupertino => () {
        return CupertinoActivityIndicator(
          key: key,
          animating: iosAnimating,
          radius: iosRadius,
        );
      };
}
