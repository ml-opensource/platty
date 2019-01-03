import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platty/src/platform_helpers.dart';
import 'package:platty/src/theme.dart';

/// This class adapts the app theme to the specified platform.
/// On Android this is [MaterialApp]
/// On iOS this is [CupertinoApp].
class PlatformApp extends StatelessWidget {
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

  /// This will be used to paint widgets on both Android and iOS. on iOS we utilize
  /// a [MaterialBasedCupertinoThemeData] to synchronize the colors.
  final ThemeData unifiedTheme;

  final MaterialBasedCupertinoThemeData cupertinoThemeData;

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
    @required this.unifiedTheme,
  })  : assert(unifiedTheme != null),
        cupertinoThemeData =
            MaterialBasedCupertinoThemeData(materialTheme: unifiedTheme),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = theme ?? PTheme.of(context);
    return PTheme(
      data: data,
      child: MaterialApp(
        routes: routes,
        initialRoute: initialRoute,
        onGenerateRoute: onGenerateRoute,
        onUnknownRoute: onUnknownRoute,
        // utilize main navigator observers in the corresponding platform app.
        navigatorObservers: platformSelect(context,
            renderMaterial: (context) => navigatorObservers,
            renderCupertino: (context) => []),
        builder: builder,
        title: title,
        onGenerateTitle: onGenerateTitle,
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
        theme: unifiedTheme,
        home: CupertinoApp(
          theme: cupertinoThemeData,
          routes: routes,
          initialRoute: initialRoute,
          onGenerateRoute: onGenerateRoute,
          onUnknownRoute: onUnknownRoute,
          navigatorObservers: platformSelect(context,
              renderMaterial: (context) => [],
              renderCupertino: (context) => navigatorObservers),
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
      ),
    );
  }

  /// Patch Cupertino missing necessary Material Localizations, throwing debug errors by
  /// manually including the [DefaultMaterialLocalizations]
  Iterable<LocalizationsDelegate<dynamic>>
      get _patchCupertinoLocalizationsDelegates sync* {
    if (localizationsDelegates != null) yield* localizationsDelegates;
    yield DefaultMaterialLocalizations.delegate;
  }
}
