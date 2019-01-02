import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platty/widgets/material_patcher.dart';
import 'package:platty/widgets/platform.dart';

class PTabBar extends PlatformAdaptingWidget {
  final List<BottomNavigationBarItem> items;
  final ValueChanged<int> onTap;
  final int currentIndex;
  final double iconSize;
  final BottomNavigationBarType androidType;

  /// on iOS this is [CupertinoTabBar.inactiveColor]
  /// on Android we wrap a [Theme] providing an override on the
  /// [TextTheme.caption] color.
  final Color inactiveColor;

  /// on Android, this is the fixedColor
  /// on iOS, this is the active color
  final Color activeFixedColor;

  /// on iOS, See [CupertinoTabBar.backgroundColor]
  /// on Android, we wrap a [Theme.canvasColor] that specifies the background color
  /// to match iOS property.
  final Color backgroundColor;

  PTabBar(
      {Key key,
      @required this.items,
      this.onTap,
      this.iconSize,
      this.androidType = BottomNavigationBarType.fixed,
      this.currentIndex = 0,
      this.activeFixedColor,
      this.inactiveColor,
      this.backgroundColor,
      TargetPlatform renderPlatform})
      : super(key: key, renderPlatform: renderPlatform);

  @override
  get renderMaterial => (BuildContext context) {
        final theme = Theme.of(context);
        final backgroundColorFromTheme =
            this.backgroundColor ?? theme.bottomAppBarColor;
        return Theme(
          data: theme.copyWith(
            canvasColor: backgroundColorFromTheme,
            textTheme: theme.textTheme.copyWith(
                caption: TextStyle(
              color: inactiveColor,
            )),
          ),
          child: BottomNavigationBar(
            fixedColor: activeFixedColor,
            items: items,
            onTap: onTap,
            currentIndex: currentIndex,
            iconSize: iconSize ?? 24.0,
            type: androidType,
          ),
        );
      };

  @override
  get renderCupertino => (BuildContext context) {
        final backgroundColorFromTheme =
            this.backgroundColor ?? Theme.of(context)?.bottomAppBarColor;
        return MaterialPatcher(
          child: CupertinoTabBar(
            items: items,
            onTap: onTap,
            currentIndex: currentIndex,
            iconSize: iconSize ?? 30.0,
            activeColor: activeFixedColor,
            inactiveColor: inactiveColor,
            backgroundColor: backgroundColorFromTheme,
          ),
        );
      };
}
