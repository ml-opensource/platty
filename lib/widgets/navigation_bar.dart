import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:platty/widgets/platform.dart';

/// A widget that attempts to consolidate the different behaviors of each platform into
/// one single, [PlatformAdaptingWidget]. 
class PNavigationBar extends PlatformAdaptingWidget {
  /// Leave null for default behavior on each platform.
  /// See [CupertinoNavigationBar.leading]
  /// See [AppBar.leading]
  final Widget leading;

  /// The list of actions to apply here. The [CupertinoNavigationBar]
  /// only takes the first widget supplied here.
  /// See [AppBar.actions]
  /// See [CupertinoNavigationBar.trailing]
  final List<Widget> actions;

  /// On Android this is left-aligned.
  /// On iOS this is center-aligned.
  /// See [CupertinoNavigationBar.middle]
  /// See [AppBar.title]
  final Widget title;

  PNavigationBar({this.leading, this.actions, this.title});

  @override
  get renderMaterial => () {
        return AppBar(
          leading: leading,
          title: title,
          actions: actions,
        );
      };

  @override
  get renderCupertino => () {
        return CupertinoNavigationBar(
          leading: leading,
          middle: title,
          trailing:
              actions != null && actions.length >= 1 ? actions?.first : null,
        );
      };
}
