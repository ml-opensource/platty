# platty

Platform Conforming Widgets for Flutter!

Flutter makes no attempt to provide familiar widgets for a specific platform (unlike React Native, ionic, and other cross platform tooling). 
This has enormous benefits to unified rendering on all platforms, maximum flexibility, and eliminating a whole class of bugs and testing done for 
each platform. While this is great, many scenarios we want our apps to look and feel like an Android or iOS app. 
Platty allows you to render iOS (Cupertino) and Android (Material) like widgets with minimal effort and maximum control in a unified 
API. 

No more checking for platform inside render blocks to render a `CupertinoButton` or `FlatButton`, let `platty` do the logic for you! 
Want to use bottom tabs in your app that resolve to platform specific UI? No problem! 

## Widgets

List of Widget Files:

[Alerts](/lib/widgets/alert.dart)

[Back Button](/lib/widgets/back_button.dart)

[Buttons](/lib/widgets/button.dart)

[Navigation Bars](/lib/widgets/navigation_bar.dart)

[Progress](/lib/widgets/progress.dart)

[Routing](/lib/widgets/routing.dart)

[Scaffold](/lib/widgets/scaffold.dart)

[Slider](/lib/widgets/slider.dart)

[Switch](/lib/widgets/switches.dart)

[TabView](/lib/widgets/tabs.dart)


## Getting Started

Use platty to unify render-specific APIs for you. The library utilizes the `BuildContext` theming APIs to propagate platform 
information into the Widgets.

By default, all widgets conform to the default `TargetPlatform`. It looks up the `Theme.of(context).platform` for its default.
Also, all widgets provide a `renderPlatform` prop that allows you to choose which one to render (if you wish).

Replace `MaterialApp` and `CupertinoApp` with `PlatformApp`:

```dart

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return PlatformApp(
      title: 'Flutter Demo',
      
      // specify Android Material Theme data here. it's a lazy evaluated function, only rendering if platform is Android.
      androidTheme: () => ThemeData(
            
            primarySwatch: Colors.lightBlue,
            bottomAppBarColor: Colors.red,
          ),
      renderPlatform: TargetPlatform.android, // specify which `App` class you want to utilize. In this case we want MaterialApp
      home: ExamplePage(),
    );
  }
}

```

`PlatformApp` unifies all of the same properties between `MaterialApp` and `CupertinoApp` to allow you to choose.

_NOTE_: Not specifying a `renderPlatform` will render a `CupertinoApp` on `iOS`, and might cause issues with widgets that expect 
a material app instance. 

_NOTE_: There is not a `CupertinoTheme` just yet in Flutter. Check out this [pull request](https://github.com/flutter/flutter/pull/23759) . 
once that is in the main flutter releases, we can then create `PTheme` that merges `MaterialTheme` and `CupertinoTheme` 
instances. For now it is highly recommended to specify `targetPlatform: TargetPlatform.android` in the constructor of `PlatformApp`. 

Now you replace widgets that are included in this library with their "P" counterparts:

`Button`/`CupertinoButton` -> `PButton`

`FlatButton`/`CupertinoButton` -> `PFlatButton`

`AppBar`/`CupertinoNavigationBar` -> `PNavigationBar`

`SliverAppBar`/`CupertinoSliverNavigationBar` -> `PSliverNavigationBar`

`Slider`/`CupertinoSlider` -> `PSlider`

`Switch`/`CupertinoSwitch` -> `PSwitch`

`BottomNavigationBar`/`CupertinoTabBar` -> `PTabBar`

`Scaffold`/`CupertinoScaffold` -> `PScaffold`

`CircularProgressIndicator`/`CupertinoActivityIndicator` -> `PActivityIndicator`

`BackButton`/`CupertinoNavigationBarBackButton` -> `PBackButton`

`AlertDialog`/`CupertinoAlertDialog` -> `PAlertDialog`

Any widgets that have ios-only or android-only counterparts, they are prefixed to `android`/`ios` accordingly:

For example `PButton`, `androidShape` applies to `RaisedButton.shape` property. It does not exist on a `CupertinoButton`. 
However `CupertinoButton` has a `borderRadius` and `pressedOpacity`. Those two props become `iosBorderRadius` and `iosPressedOpacity`.

## Helpers

### Specific Platform Instance

To have a specific `P`-Widget utilize a specific platform theme only, such as Material or Cupertino, you can wrap
it in a `PTheme` instance:

```dart
PTheme(
  data: PThemeData(
    platform: TargetPlatform.android,  // or iOS
    child: child,
  ),
);
```

Or, more simply, utilize helper method:
```dart
PTheme.ios(child);
PTheme.android(child);
```


### Creating Your Own Platform-Adapting Widgets

We can extend upon the logic included in this library to build our own, powerful platform-adapting widgets.
Included in the library is the `PlatformAdaptingWidget` base class, which inherits from `StatelessWidget`.


```dart
class SamplePlatformWidget extends PlatformAdaptingWidget {
  final Color color;

  SamplePlatformWidget({Key key, @required this.color, TargetPlatform renderPlatform}) // should allow consumers to choose TargetPlatform
      : super(key: key, renderPlatform: renderPlatform);

  /// Render a material widget here. Most Material widgets require a Material Theme instance above it.
  @override
  get renderMaterial => (BuildContext context) {
        return BackButton(
          color: color,
        );
      };

  /// Render a cupertino widget here.
  @override
  get renderCupertino => (BuildContext context) {
        return CupertinoNavigationBarBackButton(
          color: color,
        );
      };
  
  /// Render a fuchsia widget here. (defaults to material)
    @override
    get renderFuchsia => (BuildContext context) {
          return BackButton(
            color: color,
          );
        };
}
```

