import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platty/theme.dart';
import 'package:platty/widgets/platform.dart';

/// This class adapts the app theme to the specified platform.
/// On Android this is [MaterialApp]
/// On iOS this is [CupertinoApp].
class PlatformApp extends PlatformAdaptingWidget {
  // The main [PTheme] object to utilize app-wide. If null, a default one is created for you.
  final PThemeData theme;

  final Map<String, WidgetBuilder> routes;
  final String initialRoute;
  final RouteFactory onGenerateRoute;
  final RouteFactory onUnknownRoute;
  final List<NavigatorObserver> navigatorObservers;
  final TransitionBuilder builder;
  final String title;
  final GenerateAppTitle onGenerateTitle;
  final Widget home;
  final Color color;
  final Locale locale;
  final LocaleResolutionCallback localeResolutionCallback;
  final Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates;
  final Iterable<Locale> supportedLocales;
  final bool showPerformanceOverlay;
  final bool checkerboardRasterCacheImages;
  final bool checkerboardOffscreenLayers;
  final bool showSemanticsDebugger;
  final bool debugShowCheckedModeBanner;

  /// lazy android theme. This may be expensive, so its lazy to not evaluate it unless
  /// Material theming is used.
  final ThemeData Function() androidTheme;

  ThemeData _androidTheme;

  ThemeData _getAndroidTheme() {
    if (_androidTheme == null) {
      _androidTheme = androidTheme();
    }
    return _androidTheme;
  }

  PlatformApp({
    Key key,
    this.theme =
        const PThemeData(), // default to no platform specified, falls back on Context platform.
    this.routes = const <String, WidgetBuilder>{},
    this.initialRoute,
    this.onGenerateRoute,
    this.onUnknownRoute,
    this.navigatorObservers = const [],
    this.builder,
    this.title = '',
    this.onGenerateTitle,
    this.home,
    this.color,
    this.locale,
    this.localizationsDelegates,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.localeResolutionCallback,
    this.showPerformanceOverlay = false,
    this.checkerboardRasterCacheImages = false,
    this.checkerboardOffscreenLayers = false,
    this.showSemanticsDebugger = false,
    this.debugShowCheckedModeBanner = true,
    this.androidTheme,

    /// Specifying this will override the [PThemeData]
    TargetPlatform renderPlatform,
  }) : super(key: key, renderPlatform: renderPlatform ?? theme?.platform);

  @override
  get renderMaterial => (BuildContext context) {
        final data = theme ?? PTheme.of(context);
        return PTheme(
          data: data,
          child: MaterialApp(
            routes: routes,
            initialRoute: initialRoute,
            onGenerateRoute: onGenerateRoute,
            onUnknownRoute: onUnknownRoute,
            navigatorObservers: navigatorObservers,
            builder: builder,
            title: title,
            onGenerateTitle: onGenerateTitle,
            home: home,
            color: color,
            locale: locale,
            localizationsDelegates: localizationsDelegates,
            supportedLocales: supportedLocales,
            localeResolutionCallback: localeResolutionCallback,
            showPerformanceOverlay: showPerformanceOverlay,
            checkerboardRasterCacheImages: checkerboardRasterCacheImages,
            checkerboardOffscreenLayers: checkerboardOffscreenLayers,
            showSemanticsDebugger: showSemanticsDebugger,
            debugShowCheckedModeBanner: debugShowCheckedModeBanner,
            theme: _getAndroidTheme(),
          ),
        );
      };

  @override
  get renderCupertino => (BuildContext context) {
        final data = theme ?? PTheme.of(context);
        return PTheme(
          data: data,
          child: CupertinoApp(
            routes: routes,
            initialRoute: initialRoute,
            onGenerateRoute: onGenerateRoute,
            onUnknownRoute: onUnknownRoute,
            navigatorObservers: navigatorObservers,
            builder: builder,
            title: title,
            onGenerateTitle: onGenerateTitle,
            home: home,
            color: color,
            locale: locale,
            localizationsDelegates: _patchCupertinoLocalizationsDelegates,
            supportedLocales: supportedLocales,
            localeResolutionCallback: localeResolutionCallback,
            showPerformanceOverlay: showPerformanceOverlay,
            checkerboardRasterCacheImages: checkerboardRasterCacheImages,
            checkerboardOffscreenLayers: checkerboardOffscreenLayers,
            showSemanticsDebugger: showSemanticsDebugger,
            debugShowCheckedModeBanner: debugShowCheckedModeBanner,
          ),
        );
      };

  /// Patch Cupertino missing necessary Material Localizations, throwing debug errors by
  /// manually including the [DefaultMaterialLocalizations]
  Iterable<LocalizationsDelegate<dynamic>>
      get _patchCupertinoLocalizationsDelegates sync* {
    if (localizationsDelegates != null) yield* localizationsDelegates;
    yield DefaultMaterialLocalizations.delegate;
  }
}
