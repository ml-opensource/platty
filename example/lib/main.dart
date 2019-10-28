import 'package:example/example_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platty/platty.dart';

void main() => runApp(new PlattyApp());

class PlattyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return PlatformApp(
      title: 'Plaform Adapting Widgets Example',
      unifiedTheme: ThemeData(
        disabledColor: Colors.red.withAlpha(150),
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red),
        buttonTheme: ButtonThemeData(
          textTheme: ButtonTextTheme.primary,
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      home: ExamplePage(),
    );
  }
}
