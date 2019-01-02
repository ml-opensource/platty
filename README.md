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

[Alerts](/lib/src/widgets/alert.dart)

[Back Button](/lib/src/widgets/back_button.dart)

[Buttons](/lib/src/widgets/button.dart)

[Navigation Bars](/lib/src/widgets/navigation_bar.dart)

[Progress](/lib/src/widgets/progress.dart)

[Routing](/lib/src/widgets/routing.dart)

[Scaffold](/lib/src/widgets/scaffold.dart)

[Slider](/lib/src/widgets/slider.dart)

[Switch](/lib/src/widgets/switches.dart)

[TabView](/lib/src/widgets/tabs.dart)


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
      // specify our app theme here. We do the leg work of bridging it to Cupertino.
      unifiedTheme: ThemeData(
            primarySwatch: Colors.lightBlue,
            bottomAppBarColor: Colors.red,
          ),
      home: ExamplePage(),
    );
  }
}

```

`PlatformApp` unifies all of the same properties between `MaterialApp` and `CupertinoApp` to allow both instances of widgets in the hiearchy and 
switching styling based on platform.

Now you replace widgets that are included in this library with their "P" counterparts:

`Button`/`CupertinoButton` -> `PButton`

![Material Raised Button](/screenshots/materialbutton.png)
![Cupertino Button](/screenshots/cupertinobutton.png)

[Source](/example/lib/button_page.dart)

`FlatButton`/`CupertinoButton` -> `PFlatButton`

![Material Flat Button](/screenshots/androidflat.png)
![Cupertino Flat Button](/screenshots/iosflat.png)

[Source](/example/lib/button_page.dart)

`AppBar`/`CupertinoNavigationBar` -> `PNavigationBar`

![Android Nav](/screenshots/androidnav.png)
![iOS Nav](/screenshots/iosnav.png)

[Source](/example/lib/navigation_bar_page.dart)

`SliverAppBar`/`CupertinoSliverNavigationBar` -> `PSliverNavigationBar`

`Slider`/`CupertinoSlider` -> `PSlider`

![Sliders](/screenshots/sliders.png)

[Source](/example/lib/sliders_page.dart)

`Switch`/`CupertinoSwitch` -> `PSwitch`

![Switch](/screenshots/switches.png)

[Source](/example/lib/switches_page.dart)

`BottomNavigationBar`/`CupertinoTabBar` -> `PTabBar`

![Bottom Navigation Android](/screenshots/androidtabs.png)
![Bottom Navigation iOS](/screenshots/iostabs.png)

[Source](/example/lib/tabs_page.dart)

`Scaffold`/`CupertinoScaffold` -> `PScaffold`

`CircularProgressIndicator`/`CupertinoActivityIndicator` -> `PActivityIndicator`

![Progress](/screenshots/progress.png)

[Source](/example/lib/progress_page.dart)

`BackButton`/`CupertinoNavigationBarBackButton` -> `PBackButton`

`AlertDialog`/`CupertinoAlertDialog` -> `PAlertDialog`

![Android Alert](/screenshots/androidalert.png)
![Ios Alert](/screenshots/iosalert.png)

[Source](/example/lib/alert_page.dart)

### Properties Specific to a platform have a prefix
Any widgets that have ios-only or android-only counterparts, they are prefixed to `android`/`ios` accordingly:

For example `PButton`, `androidShape` applies to `RaisedButton.shape` property. It does not exist on a `CupertinoButton`. 
However `CupertinoButton` has a `borderRadius` and `pressedOpacity`. Those two props become `iosBorderRadius` and `iosPressedOpacity`.

## Helpers

This library bundles a few standard functions to easily return code that is unique for each platform. Instead of checking  
and switching on the result of `Theme.of(context).targetPlatform`, utilize the following methods:

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


Also, all `P`-widgets and methods allow you to override the `PTheme` with a `renderPlatform` parameter in their constructor 
or calling method:
```dart
PButton("Hello Android", 
  renderPlatform: TargetPlatform.Android,
)
```
This will swap the rendering over to `Material` widgets for this specific widget.

__Note__: Wrapping a widget with the `PTheme` will propagate that instance down the widget hierarchy and is thus preferred than 
manually specifying the `renderPlatform` for each individual widget. 

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

### Platform-specific logic

This library comes with a few standard ways to implement behavior based on platform.
You can utilize `platformWrap`, which allows you to specify a `child`, and on 1 or all platforms, wrap it 
with another widget:

```dart
platformWrap(
      context,
      child: PButton(
        padding: EdgeInsets.all(0.0),
        child: Text(title),
        color: Colors.red,
        onPressed: () {
          Navigator.push(context, PlatformRoute.of(context, builder: page));
        },
      ),
      renderCupertino: (context, child) => Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: child,
          ),
    );
```
You can specify any of `renderCupertino`, `renderMaterial`, or `renderFuschia` (or none). 
Any render methods not specified default to the `child`.

Also, `platformSelect` is a helper that enables returning different objects based on platform in a unified way.
In our `PlatformAdaptingWidget`, we utilize it to return a different widget based on platform. You can use it to return any 
return type based on platform:
```dart

Column(
  children: [
    platformSelect(context, 
      renderMaterial: (context) => Text("I am android"),
      renderCupertino: (context) => Text("I am iOS"),
      renderFuchsia: (context) => Text("I am FUCHSIA")) 
  ],
),

```

`renderMaterial` and `renderCupertino` are required. `renderFuchsia` defaults to material.

or you can return a non-widget too:
```dart
Column(
  children: [
    Text(platformSelect(context, 
      renderMaterial: (context) => "I am android"),
      renderCupertino: (context) => "I am iOS",
      renderFuchsia: (context) => "I am FUCHSIA")) 
  ],
),

```
