import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:platty/src/widgets/material_patcher.dart';
import 'package:platty/src/widgets/navigation_bar.dart';
import 'package:platty/src/widgets/platform.dart';

/// Adapts the widget to a [Scaffold] on Android and [CupertinoPageScaffold] on iOS.
/// This widget does not attempt to provide [FloatingActionButton] support on Android. If you need
/// that, use the [Scaffold] directly.
class PScaffold extends PlatformAdaptingWidget {
  final Widget child;
  final PNavigationBar appBar;
  final Color backgroundColor;

  /// On iOS see [CupertinoPageScaffold.resizeToAvoidBottomInset]
  /// On Android see [Scaffold.resizeToAvoidBottomPadding]
  final resizeToAvoidBottomInsetPadding;

  PScaffold(
      {Key key,
      @required this.child,
      this.appBar,
      this.backgroundColor,
      this.resizeToAvoidBottomInsetPadding = true,
      TargetPlatform renderPlatform})
      : super(key: key, renderPlatform: renderPlatform);

  @override
  get renderMaterial => (BuildContext context) {
        return Scaffold(
          body: child,
          appBar: appBar,
          backgroundColor: backgroundColor,
          resizeToAvoidBottomPadding: resizeToAvoidBottomInsetPadding,
        );
      };

  @override
  get renderCupertino => (BuildContext context) {
        return MaterialPatcher(
          child: CupertinoPageScaffold(
            child: child,
            navigationBar: appBar,
            backgroundColor: backgroundColor ?? Colors.white,
            resizeToAvoidBottomInset: resizeToAvoidBottomInsetPadding,
          ),
        );
      };
}
