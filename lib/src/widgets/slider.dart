import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:platty/src/widgets/material_patcher.dart';

import 'platform.dart';

/// A [PlatformAdaptingWidget] that renders a [Slider] on Android and [CupertinoSlider]
/// on iOS.
class PSlider extends PlatformAdaptingWidget {
  final double value;
  final ValueChanged<double> onChanged;
  final ValueChanged<double> onChangeStart;
  final ValueChanged<double> onChangeEnd;
  final double min;
  final double max;
  final int divisions;
  final Color activeColor;

  /// See [Slider.activeColor]
  final Color androidInActiveColor;

  PSlider(
      {Key key,
      @required this.value,
      @required this.onChanged,
      this.onChangeEnd,
      this.onChangeStart,
      this.max = 1.0,
      this.min = 0.0,
      this.divisions,
      this.activeColor,
      this.androidInActiveColor,
      TargetPlatform renderPlatform})
      : super(key: key, renderPlatform: renderPlatform);

  @override
  get renderMaterial => (BuildContext context) {
        return Slider(
          value: value,
          onChanged: onChanged,
          onChangeEnd: onChangeEnd,
          onChangeStart: onChangeStart,
          max: max,
          min: min,
          divisions: divisions,
          activeColor: activeColor,
          inactiveColor: androidInActiveColor,
        );
      };

  @override
  get renderCupertino => (BuildContext context) {
        return MaterialPatcher(
          child: CupertinoSlider(
            value: value,
            onChanged: onChanged,
            onChangeStart: onChangeStart,
            onChangeEnd: onChangeEnd,
            min: min,
            max: max,
            divisions: divisions,
            activeColor: activeColor,
          ),
        );
      };
}
