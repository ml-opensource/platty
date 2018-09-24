import 'package:flutter/widgets.dart';
import 'package:platty/theme.dart';

abstract class PlatformAdaptingWidget extends StatelessWidget {
  Widget Function() get renderMaterial;

  Widget Function() get renderCupertino;

  /// Can specify a [TargetPlatform] on the fly on a per-widget basis.
  /// This is simpler than just wrapping a single widget in a [PTheme] widget.
  final TargetPlatform renderPlatform;

  const PlatformAdaptingWidget({Key key, this.renderPlatform})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final platform = this.renderPlatform ?? PTheme.of(context).data.platform;

    return platform == TargetPlatform.android
        ? renderMaterial()
        : renderCupertino();
  }
}
