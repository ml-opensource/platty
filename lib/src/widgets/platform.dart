import 'package:flutter/widgets.dart';
import 'package:platty/src/platform_helpers.dart';
import 'package:platty/src/theme.dart';

abstract class PlatformAdaptingWidget extends StatelessWidget {
  /// Return the widget to construct for the [TargetPlatform.android]
  WidgetBuilder get renderMaterial;

  /// Return the widget to construct for the [TargetPlatform.iOS]
  WidgetBuilder get renderCupertino;

  /// Return the widget to construct for the [TargetPlatform.fuschia]. For now,
  /// this defaults to the material design components.
  WidgetBuilder get renderFuchsia => renderMaterial;

  /// Can specify a [TargetPlatform] on the fly on a per-widget basis.
  /// This is simpler than just wrapping a single widget in a [PTheme] widget.
  final TargetPlatform renderPlatform;

  const PlatformAdaptingWidget({Key key, this.renderPlatform})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return platformSelect(context,
        renderPlatform: this.renderPlatform,
        renderMaterial: renderMaterial,
        renderCupertino: renderCupertino,
        renderFuchsia: renderFuchsia);
  }
}
