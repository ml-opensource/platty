import 'package:flutter/widgets.dart';
import 'package:platty/PTheme.dart';

abstract class PlatformAdaptingWidget extends StatelessWidget {
  Widget Function() get renderMaterial;

  Widget Function() get renderCupertino;

  const PlatformAdaptingWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final platform = PTheme.of(context).data.platform;

    return platform == TargetPlatform.android
        ? renderMaterial()
        : renderCupertino();
  }
}
