import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:platty/theme.dart';

class PlatformRoute {
  static Route<T> of<T>(
    BuildContext context, {
    @required WidgetBuilder builder,
    RouteSettings settings,
    bool maintainState = true,
    bool fullScreenDialog = false,
    String iosTitle,
  }) {
    final platform = PTheme.of(context).data.platform;
    if (platform == TargetPlatform.android) {
      return MaterialPageRoute(
          builder: builder,
          settings: settings,
          maintainState: maintainState,
          fullscreenDialog: fullScreenDialog);
    } else {
      return CupertinoPageRoute(
        builder: builder,
        settings: settings,
        maintainState: maintainState,
        fullscreenDialog: fullScreenDialog,
        title: iosTitle,
      );
    }
  }
}
