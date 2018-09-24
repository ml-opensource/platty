import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platty/widgets/platform.dart';

class PTabView extends PlatformAdaptingWidget {
  final List<BottomNavigationBarItem> items;
  final ValueChanged<int> onTap;
  final int currentIndex;
  final double iconSize;
  final BottomNavigationBarType androidType;
  final Color iosInactiveColor;

  /// on Android, this is the fixedColor
  /// on iOS, this is the active color
  final Color activeFixedColor;

  PTabView(
      {@required this.items,
      this.onTap,
      this.iconSize,
      this.androidType = BottomNavigationBarType.fixed,
      this.currentIndex = 0,
      this.activeFixedColor,
      this.iosInactiveColor,
      TargetPlatform renderPlatform})
      : super(renderPlatform: renderPlatform);

  @override
  get renderMaterial => () {
        return BottomNavigationBar(
          items: items,
          onTap: onTap,
          currentIndex: currentIndex,
          iconSize: iconSize,
          type: androidType,
          fixedColor: activeFixedColor,
        );
      };

  @override
  get renderCupertino => () {
        return CupertinoTabBar(
          items: items,
          onTap: onTap,
          currentIndex: currentIndex,
          iconSize: iconSize,
          activeColor: activeFixedColor,
          inactiveColor: iosInactiveColor,
        );
      };
}
