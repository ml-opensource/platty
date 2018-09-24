import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:platty/widgets/platform.dart';

// copied from iOS source.
const double _kNavBarPersistentHeight = 44.0;
const Color _kDefaultNavBarBackgroundColor = Color(0xCCF8F8F8);

/// A widget that attempts to consolidate the different behaviors of each platform into
/// one single, [PlatformAdaptingWidget].
class PNavigationBar extends PlatformAdaptingWidget
    implements ObstructingPreferredSizeWidget {
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

  /// Android only-widget that appears at the bottom of the [AppBar]
  /// See [AppBar.bottom]
  final PreferredSizeWidget androidBottom;

  final Color backgroundColor;

  PNavigationBar(
      {this.leading,
      this.actions,
      this.title,
      this.androidBottom,
      this.backgroundColor,
      TargetPlatform renderPlatform})
      : super(renderPlatform: renderPlatform);

  @override
  Size get preferredSize {
    // TODO: better way of adapting platform here. We do not respect PTheme.
    if (Platform.isAndroid) {
      return Size.fromHeight(
          kToolbarHeight + (androidBottom?.preferredSize?.height ?? 0.0));
    } else {
      return Size.fromHeight(_kNavBarPersistentHeight);
    }
  }

  /// True if the navigation bar's background color has no transparency.
  /// See [CupertinoNavigationBar.fullObstruction]
  @override
  bool get fullObstruction {
    return (backgroundColor ?? _kDefaultNavBarBackgroundColor).alpha == 0xFF;
  }

  @override
  get renderMaterial => () {
        return AppBar(
          leading: leading,
          title: title,
          actions: actions,
          backgroundColor: backgroundColor,
        );
      };

  @override
  get renderCupertino => () {
        return CupertinoNavigationBar(
          leading: leading,
          middle: title,
          trailing:
              actions != null && actions.length >= 1 ? actions?.first : null,
          backgroundColor: backgroundColor ?? _kDefaultNavBarBackgroundColor,
        );
      };
}
