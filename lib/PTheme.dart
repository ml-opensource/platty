import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PTheme extends InheritedWidget {
  final PThemeData data;

  PTheme({this.data});

  static PTheme of(BuildContext context) {
    final PTheme theme = context.inheritFromWidgetOfExactType(PTheme);
    return theme?.data?.platform != null
        ? theme.data
        : PTheme(
            data: PThemeData(
              platform: Theme.of(context).platform,
            ),
          );
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return oldWidget != this;
  }
}

class PThemeData {
  // if null, we respect the platform of the device.
  final TargetPlatform platform;

  PThemeData({this.platform});
}
