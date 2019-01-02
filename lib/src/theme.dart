import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PTheme extends InheritedWidget {
  PThemeData data;

  PTheme({
    Key key,
    this.data = const PThemeData(),
    Widget child,
  }) : super(key: key, child: child);

  static PTheme of(BuildContext context) {
    PTheme theme = context.inheritFromWidgetOfExactType(PTheme);
    if (theme == null) {
      theme = PTheme();
    }
    if (theme.data.platform == null) {
      theme.data = PThemeData(platform: defaultTargetPlatform);
    }
    return theme;
  }

  static PTheme preferredPlatform(
      {@required Widget child, @required TargetPlatform renderPlatform}) {
    return PTheme(
      data: PThemeData(platform: renderPlatform),
      child: child,
    );
  }

  static PTheme ios(Widget child) =>
      preferredPlatform(child: child, renderPlatform: TargetPlatform.iOS);

  static PTheme android(Widget child) =>
      preferredPlatform(child: child, renderPlatform: TargetPlatform.android);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    if (oldWidget is PTheme) {
      // compare platform, if change, rebuild widgets.
      if (oldWidget.data?.platform != data?.platform) {
        return true;
      }
    }
    return oldWidget != this;
  }
}

class PThemeData {
  // if null, we respect the platform of the device.
  final TargetPlatform platform;

  const PThemeData({this.platform});
}
