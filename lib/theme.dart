import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PTheme extends InheritedWidget {
  final PThemeData data;

  const PTheme({Key key, this.data, Widget child})
      : super(key: key, child: child);

  static PTheme of(BuildContext context) {
    final PTheme theme = context.inheritFromWidgetOfExactType(PTheme);
    return theme?.data?.platform != null
        ? theme
        : PTheme(
            data: PThemeData(
              platform: Theme.of(context).platform,
            ),
          );
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
    return oldWidget != this;
  }
}

class PThemeData {
  // if null, we respect the platform of the device.
  final TargetPlatform platform;

  PThemeData({this.platform});
}
