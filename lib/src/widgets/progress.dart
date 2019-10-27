import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'platform.dart';

class PActivityIndicator extends PlatformAdaptingWidget {
  final Animation<Color> androidValueColor;
  final double androidStrokeWidth;

  final bool iosAnimating;
  final double iosRadius;

  final String semanticsLabel;
  final String semanticsValue;

  PActivityIndicator(
      {Key key,
      this.androidValueColor,
      this.androidStrokeWidth,
      this.iosAnimating = true,
      this.iosRadius = 10.0,

      /// hope that Flutter iOS will support this in the future for ADA
      this.semanticsLabel,
      this.semanticsValue,
      TargetPlatform renderPlatform})
      : super(key: key, renderPlatform: renderPlatform);

  @override
  get renderMaterial => (BuildContext context) {
        return CircularProgressIndicator(
          key: key,
          valueColor: androidValueColor,
          semanticsLabel: semanticsLabel,
          semanticsValue: semanticsValue,
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
