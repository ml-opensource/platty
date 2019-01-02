import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:platty/src/widgets/material_patcher.dart';
import 'package:platty/src/widgets/platform.dart';

// copied from iOS source.
const double _kNavBarPersistentHeight = 44.0;
const Color _kDefaultNavBarBackgroundColor = Color(0xCCF8F8F8);
const double _defaultElevationAndroid = 4.0;
const bool _defaultCenterTitleAndroid = false;

abstract class PNavigationBarBase extends PlatformAdaptingWidget {
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

  /// Android only-widget that appears at the bottom of the [AppBar].
  /// A function since it may not be rendered.
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

  final Color iconColor;

  final Object iosHeroTag;

  PNavigationBarBase(
      {Key key,
      @required this.leading,
      @required this.actions,
      @required this.title,
      @required PreferredSizeWidget Function() androidBottom,
      @required this.backgroundColor,
      @required this.iosPreviousPageTitle,
      @required this.iosPadding,
      @required this.androidElevation,
      @required this.androidFlexibleSpace,
      @required this.androidCenterTitle,
      @required this.androidTitleSpacing,
      @required this.iconColor,
      @required this.iosHeroTag,
      TargetPlatform renderPlatform})
      : this.androidBottom = androidBottom != null ? androidBottom() : null,
        super(key: key, renderPlatform: renderPlatform);

  getPrimaryIOSAction() =>
      actions != null && actions.length >= 1 ? actions?.first : null;

  IconThemeData applyIconColor(ThemeData theme) {
    return iconColor != null
        ? theme.iconTheme.copyWith(color: iconColor)
        : null;
  }

  Color get iosBackgroundColor =>
      backgroundColor ?? _kDefaultNavBarBackgroundColor;

  Color getIosIconColor(BuildContext context) =>
      this.iconColor ??
      IconTheme.of(context)?.color ??
      CupertinoColors.activeBlue;
}

/// A widget that attempts to consolidate the different behaviors of each platform into
/// one single, [PlatformAdaptingWidget].
class PNavigationBar extends PNavigationBarBase
    implements ObstructingPreferredSizeWidget {
  PNavigationBar(
      {Key key,
      Widget leading,
      List<Widget> actions,
      Widget title,
      PreferredSizeWidget Function() androidBottom,
      Color backgroundColor,
      String iosPreviousPageTitle,
      EdgeInsetsDirectional iosPadding,
      double androidElevation = _defaultElevationAndroid,
      Widget androidFlexibleSpace,
      bool androidCenterTitle = _defaultCenterTitleAndroid,
      double androidTitleSpacing = NavigationToolbar.kMiddleSpacing,
      Color iconColor,
      Object iosHeroTag,
      TargetPlatform renderPlatform})
      : super(
          key: key,
          renderPlatform: renderPlatform,
          title: title,
          actions: actions,
          androidBottom: androidBottom,
          backgroundColor: backgroundColor,
          iosPadding: iosPadding,
          androidElevation: androidElevation,
          androidFlexibleSpace: androidFlexibleSpace,
          iconColor: iconColor,
          iosHeroTag: iosHeroTag,
          androidTitleSpacing: androidTitleSpacing,
          androidCenterTitle: androidCenterTitle,
          iosPreviousPageTitle: iosPreviousPageTitle,
          leading: leading,
        );

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
    return iosBackgroundColor.alpha == 0xFF;
  }

  @override
  get renderMaterial => (BuildContext context) {
        final theme = Theme.of(context);
        return AppBar(
          leading: leading,
          title: title,
          actions: actions,
          backgroundColor: backgroundColor,
          elevation: androidElevation,
          flexibleSpace: androidFlexibleSpace,
          centerTitle: androidCenterTitle,
          titleSpacing: androidTitleSpacing,
          iconTheme: applyIconColor(theme),
          bottom: androidBottom,
        );
      };

  @override
  get renderCupertino => (BuildContext context) {
        return MaterialPatcher(
            child: iosHeroTag != null
                ? CupertinoNavigationBar(
                    heroTag: iosHeroTag,
                    transitionBetweenRoutes: false,
                    leading: leading,
                    middle: title,
                    trailing: getPrimaryIOSAction(),
                    backgroundColor: iosBackgroundColor,
                    previousPageTitle: iosPreviousPageTitle,
                    padding: iosPadding,
                    actionsForegroundColor: getIosIconColor(context),
                  )
                : CupertinoNavigationBar(
                    leading: leading,
                    middle: title,
                    trailing: getPrimaryIOSAction(),
                    backgroundColor: iosBackgroundColor,
                    previousPageTitle: iosPreviousPageTitle,
                    padding: iosPadding,
                    actionsForegroundColor: getIosIconColor(context),
                  ));
      };
}

/// Sliver implementation of the [PNavigationBar].
class PSliverNavigationBar extends PNavigationBarBase {
  /// See [SliverAppBar.floating]
  final bool androidFloating;

  /// See [SliverAppBar.pinned]
  final bool androidPinned;

  /// See [SliverAppBar.snap]
  final bool androidSnap;

  /// See [CupertinoSliverNavigationBar.largeTitle]
  final Widget iosLargeTitle;

  /// See [CupertinoSliverNavigationBar.actionsForegroundColor]
  final Color iosActionsForegroundColor;

  PSliverNavigationBar(
      {Key key,
      Widget leading,
      List<Widget> actions,
      Widget title,
      PreferredSizeWidget Function() androidBottom,
      Color backgroundColor,
      this.androidFloating = false,
      this.androidPinned = false,
      this.androidSnap = false,
      Widget androidFlexibleSpace,
      EdgeInsetsDirectional iosPadding,
      this.iosLargeTitle,
      this.iosActionsForegroundColor,
      String iosPreviousPageTitle,
      double androidElevation,
      bool androidCenterTitle = _defaultCenterTitleAndroid,
      double androidTitleSpacing = NavigationToolbar.kMiddleSpacing,
      Object iosHeroTag,
      Color iconColor,
      TargetPlatform renderPlatform})
      : super(
          key: key,
          renderPlatform: renderPlatform,
          leading: leading,
          actions: actions,
          title: title,
          androidBottom: androidBottom,
          androidFlexibleSpace: androidFlexibleSpace,
          androidCenterTitle: androidCenterTitle,
          androidElevation: androidElevation,
          androidTitleSpacing: androidTitleSpacing,
          backgroundColor: backgroundColor,
          iconColor: iconColor,
          iosHeroTag: iosHeroTag,
          iosPadding: iosPadding,
          iosPreviousPageTitle: iosPreviousPageTitle,
        );

  @override
  get renderMaterial => (BuildContext context) {
        final theme = Theme.of(context);
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
          iconTheme: applyIconColor(theme),
        );
      };

  @override
  get renderCupertino => (BuildContext context) {
        return iosHeroTag != null
            ? CupertinoSliverNavigationBar(
                heroTag: iosHeroTag,
                padding: iosPadding,
                // no large title specified, utilize title as middle.,
                middle: iosLargeTitle == null ? title : null,
                leading: leading,
                trailing: getPrimaryIOSAction(),
                backgroundColor: iosBackgroundColor,
                largeTitle: iosLargeTitle,
                actionsForegroundColor: getIosIconColor(context),
                previousPageTitle: iosPreviousPageTitle,
              )
            : CupertinoSliverNavigationBar(
                padding: iosPadding,
                // no large title specified, utilize title as middle.,
                middle: iosLargeTitle == null ? title : null,
                leading: leading,
                trailing: getPrimaryIOSAction(),
                backgroundColor: iosBackgroundColor,
                largeTitle: iosLargeTitle,
                actionsForegroundColor: getIosIconColor(context),
                previousPageTitle: iosPreviousPageTitle,
              );
      };
}
