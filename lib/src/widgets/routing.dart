import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:platty/src/theme.dart';

class PlatformRoute {
  /// Constructs a new [Route] based on the inherited [PTheme] or specified [TargetPlatform].
  static Route<T> of<T>(
    BuildContext context, {
    @required WidgetBuilder builder,
    RouteSettings settings,
    bool maintainState = true,
    bool fullScreenDialog = false,
    String iosTitle,
    TargetPlatform renderPlatform,
  }) {
    final platform = renderPlatform ?? PTheme.of(context).data.platform;
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
