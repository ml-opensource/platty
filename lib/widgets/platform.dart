import 'package:flutter/widgets.dart';
import 'package:platty/theme.dart';

abstract class PlatformAdaptingWidget extends StatelessWidget {
  /// Return the widget to construct for the [TargetPlatform.android]
  Widget Function(BuildContext) get renderMaterial;

  /// Return the widget to construct for the [TargetPlatform.iOS]
  Widget Function(BuildContext) get renderCupertino;

  /// Return the widget to construct for the [TargetPlatform.fuschia]. For now,
  /// this defaults to the material design components.
  Widget Function(BuildContext) get renderFuschia => renderMaterial;

  /// Can specify a [TargetPlatform] on the fly on a per-widget basis.
  /// This is simpler than just wrapping a single widget in a [PTheme] widget.
  final TargetPlatform renderPlatform;

  const PlatformAdaptingWidget({Key key, this.renderPlatform})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final platform = this.renderPlatform ?? PTheme.of(context).data.platform;
    switch (platform) {
      case TargetPlatform.android:
        return renderMaterial(context);
      case TargetPlatform.iOS:
        return renderCupertino(context);
      case TargetPlatform.fuchsia:
        return renderFuschia(context);
    }
  }
}
