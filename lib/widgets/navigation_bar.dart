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

  /// See [AppBar.elevation]
  final double androidElevation;

  /// See [AppBar.flexibleSpace]
  final Widget androidFlexibleSpace;

  /// See [AppBar.centerTitle]
  final bool androidCenterTitle;

  /// See [AppBar.titleSpacing]
  final double androidTitleSpacing;

  final Color backgroundColor;

  /// See [CupertinoNavigationBar.previousPageTitle]
  final String iosPreviousPageTitle;

  /// See [CupertinoNavigationBar.padding]
  final EdgeInsetsDirectional iosPadding;

  PNavigationBar(
      {Key key,
      this.leading,
      this.actions,
      this.title,
      this.androidBottom,
      this.backgroundColor,
      this.iosPreviousPageTitle,
      this.iosPadding,
      this.androidElevation = 4.0,
      this.androidFlexibleSpace,
      this.androidCenterTitle,
      this.androidTitleSpacing = NavigationToolbar.kMiddleSpacing,
      TargetPlatform renderPlatform})
      : super(key: key, renderPlatform: renderPlatform);

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
          elevation: androidElevation,
          flexibleSpace: androidFlexibleSpace,
          centerTitle: androidCenterTitle,
          titleSpacing: androidTitleSpacing,
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
          previousPageTitle: iosPreviousPageTitle,
          padding: iosPadding,
        );
      };
}

/// Sliver implementation of the [PNavigationBar].
class PSliverNavigationBar extends PlatformAdaptingWidget {
  /// Leave null for default behavior on each platform.
  /// See [CupertinoSliverNavigationBar.leading]
  /// See [SliverAppBar.leading]
  final Widget leading;

  /// The list of actions to apply here. The [CupertinoSliverNavigationBar]
  /// only takes the first widget supplied here.
  /// See [SliverAppBar.actions]
  /// See [CupertinoSliverNavigationBar.trailing]
  final List<Widget> actions;

  /// On Android this is left-aligned.
  /// On iOS this is center-aligned.
  /// See [CupertinoSliverNavigationBar.middle]
  /// See [SliverAppBar.title]
  final Widget title;

  /// Android only-widget that appears at the bottom of the [SliverAppBar]
  /// See [SliverAppBar.bottom]
  final PreferredSizeWidget androidBottom;

  final Color backgroundColor;

  /// See [SliverAppBar.floating]
  final bool androidFloating;

  /// See [SliverAppBar.pinned]
  final bool androidPinned;

  /// See [SliverAppBar.snap]
  final bool androidSnap;

  /// See [SliverAppBar.elevation]
  final double androidElevation;

  /// See [SliverAppBar.flexibleSpace]
  final Widget androidFlexibleSpace;

  /// See [SliverAppBar.centerTitle]
  final bool androidCenterTitle;

  /// See [AppBar.titleSpacing]
  final double androidTitleSpacing;

  /// See [CupertinoSliverNavigationBar.padding]
  final EdgeInsetsDirectional iosPadding;

  /// See [CupertinoSliverNavigationBar.largeTitle]
  final Widget iosLargeTitle;

  /// See [CupertinoSliverNavigationBar.actionsForegroundColor]
  final Color iosActionsForegroundColor;

  /// See [CupertinoSliverNavigationBar.previousPageTitle]
  final String iosPreviousPageTitle;

  PSliverNavigationBar(
      {Key key,
      this.leading,
      this.actions,
      this.title,
      this.androidBottom,
      this.backgroundColor,
      this.androidFloating = false,
      this.androidPinned = false,
      this.androidSnap = false,
      this.androidFlexibleSpace,
      this.iosPadding,
      this.iosLargeTitle,
      this.iosActionsForegroundColor,
      this.iosPreviousPageTitle,
      this.androidElevation,
      this.androidCenterTitle,
      this.androidTitleSpacing = NavigationToolbar.kMiddleSpacing,
      TargetPlatform renderPlatform})
      : super(key: key, renderPlatform: renderPlatform);

  @override
  get renderMaterial => () {
        return SliverAppBar(
          leading: leading,
          title: title,
          actions: actions,
          bottom: androidBottom,
          backgroundColor: backgroundColor,
          pinned: androidPinned,
          floating: androidFloating,
          snap: androidSnap,
          flexibleSpace: androidFlexibleSpace,
          elevation: androidElevation,
          centerTitle: androidCenterTitle,
          titleSpacing: androidTitleSpacing,
        );
      };

  @override
  get renderCupertino => () {
        return CupertinoSliverNavigationBar(
          padding: iosPadding,
          middle: title,
          leading: leading,
          trailing:
              actions != null && actions.length >= 1 ? actions?.first : null,
          backgroundColor: backgroundColor ?? _kDefaultNavBarBackgroundColor,
          largeTitle: iosLargeTitle,
          actionsForegroundColor: iosActionsForegroundColor,
          previousPageTitle: iosPreviousPageTitle,
        );
      };
}
