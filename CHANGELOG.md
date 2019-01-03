## [0.0.8] - 1/3/2018

FIX - issue where using `navigatorObservers` in the `PlatformApp` threw an exception since if one is reused in 
multiple instances, the framework will throw an exception. Now we utilize them in whatever the current render platform is only.

## [0.0.7] - 1/2/2018

NEW - Upgrade to Flutter 1.1.4

NEW - all widgets are now marked private imports, meaning switch imports from:
```dart
import 'package:platty/widgets/alert.dart';
import 'package:platty/widgets/button.dart';
```

to:
```dart````
import 'package:platty/platty.dart';
```

This will clean up the imports and make it easier to use the library.

NEW - Library now utilizes new `CupertinoTheme` and `MaterialBasedCupertinoThemeData` to bridge styling gap between widgets finally.

`androidTheme` -> `unifiedTheme` and no longer a function. The app will utilize the material theme and properly bridge it to 
Cupertino world.

`buttonColor` for `Theme` is now reflected in `PButton` iOS as well.

`bottomAppBarColor` for `Theme` now actually works with android and iOS `PTabBar`. 

`caption` from `TextTheme` used in `Theme` now propagates to `PTabBar` as the inactive color on iOS and Android, to match behavior expected.

`iconColor` for a `PNavBar` utilizes the `IconTheme` if no `iconColor` specified. Defaults to `CupertinoColors.ActiveBlue` if all missing.


## [0.0.6] - 12/29/2018

Fixes issue where `PSliverNavigationBar` on iOS, when specifying title and `iosLargeTitle`, displays both a `middle`
and the large title. This would require dev to pass null `title` on iOS, requiring more work than necessary.

## [0.0.5] - 12/03/2018

* NEW - adds `MaterialPatcher` component to wrap certain `Cupertino` widgets so that material 
ancestors have a material reference and do not error out. This fixes error using `CupertinoApp` with 
some material ancestors without `Material` parents.

* `PlatformApp` can specify a `PTheme` to be passed down the hierarchy instead.

* FIX - swapping rendering platform from the IDE did not hot reload widgets in debug mode.

* NEW - adds `platformWrap` and `platformSelect`. `platformWrap` enables platform-specific logic 
for a component by passing down the `child` and allowing you to wrap it:

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
      // CupertinoButton does not include a margin like MaterialButton.
      renderCupertino: (context, child) => Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: child,
          ),
    );
```
You can specify any of `renderCupertino`, `renderMaterial`, or `renderFuschia` (or none). 
Any not specified default to the `child`.

`platformSelect` is a helper that enables returning different objects based on platform in a unified way.
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

## [0.0.4] - 11/25/2018

* Adds support for Fuchsia in `PlatformAdaptingWidget`, which defaults to 
`renderMaterial`.
 
* Added missing props for `MaterialButton` in `PButton` to be passed down on Android.


## [0.0.3] - 11/21/2018

Fix for PButton Border Radius on iOS. Previously did not utilize same default 
as CupertinoButton, causing button not to be rounded.

## [0.0.2] - First Release

Initial Release of platty

