import 'package:flutter/widgets.dart';
import 'package:platty/src/theme.dart';

typedef PlatformBuilder<T> = T Function(BuildContext context);
typedef ChildPlatformBuilder<T extends Widget> = T Function(
    BuildContext context, T child);

/// Allows you to arbitrarily return a value from this method based on
/// the [PTheme] or [renderPlatform] specified. It allows you to
/// efficiently choose a widget, property, or object to return based on current platform
/// in a unified way.
///
/// [renderPlatform] is optional, and should be omitted unless needed in rare cases.
T platformSelect<T>(
  BuildContext context, {
  TargetPlatform renderPlatform,
  @required PlatformBuilder<T> renderMaterial,
  @required PlatformBuilder<T> renderCupertino,
  PlatformBuilder<T> renderFuchsia,
}) {
  assert(renderMaterial != null);
  assert(renderCupertino != null);
  final platform = renderPlatform ?? PTheme.of(context).data.platform;
  switch (platform) {
    case TargetPlatform.android:
      return renderMaterial(context);
    case TargetPlatform.iOS:
      return renderCupertino(context);
    case TargetPlatform.fuchsia:
      // TODO: fallback on material selection for now.
      return renderFuchsia != null
          ? renderFuchsia(context)
          : renderMaterial(context);
    default:
      throw ArgumentError(
          "An unsupported platform of $renderPlatform was specified.");
  }
}

/// Similiar to [platformSelect] except it provides a way to wrap the passed [child]
/// on a certain platform while enabling on other platforms simply returning the child.
///
/// [renderPlatform] is optional and should be omitted except in rare cases.
///
T platformWrap<T extends Widget>(
  BuildContext context, {
  @required T child,
  TargetPlatform renderPlatform,
  ChildPlatformBuilder<T> renderMaterial,
  ChildPlatformBuilder<T> renderCupertino,
  ChildPlatformBuilder<T> renderFuchsia,
}) {
  final platform = renderPlatform ?? PTheme.of(context).data.platform;
  switch (platform) {
    case TargetPlatform.android:
      return renderMaterial != null ? renderMaterial(context, child) : child;
    case TargetPlatform.iOS:
      return renderCupertino != null ? renderCupertino(context, child) : child;
    case TargetPlatform.fuchsia:
      // TODO: fallback on material selection for now.
      return renderFuchsia != null
          ? renderFuchsia(context, child)
          : renderMaterial != null ? renderMaterial(context, child) : child;
    default:
      return child;
  }
}
