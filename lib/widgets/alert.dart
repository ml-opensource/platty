import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platty/theme.dart';
import 'package:platty/widgets/platform.dart';

Future<T> showPlatformDialog<T>({
  @required BuildContext context,
  bool androidBarrierDismissible = true,
  WidgetBuilder builder,
  TargetPlatform renderPlatform,
}) {
  final platform = renderPlatform ?? PTheme.of(context).data.platform;
  if (platform == TargetPlatform.android) {
    return showDialog(
        context: context,
        barrierDismissible: androidBarrierDismissible,
        builder: builder);
  } else {
    return showCupertinoDialog(context: context, builder: builder);
  }
}

class PAlertDialog extends PlatformAdaptingWidget {
  final Widget title;
  final Widget content;
  final List<Widget> actions;

  PAlertDialog(
      {this.title,
      this.content,
      @required this.actions,
      TargetPlatform renderPlatform})
      : super(renderPlatform: renderPlatform);

  @override
  get renderMaterial => () {
        return AlertDialog(
          title: title,
          content: content,
          actions: actions,
        );
      };

  @override
  get renderCupertino => () {
        return CupertinoAlertDialog(
          title: title,
          content: content,
          actions: actions,
        );
      };
}
