import 'package:example/example_page.dart';
import 'package:flutter/material.dart';
import 'package:platty/platform_app.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return PlatformApp(
      title: 'Plaform Adapting Widgets Example',
      androidTheme: () => ThemeData(
            primarySwatch: Colors.lightBlue,
            bottomAppBarColor: Colors.red,
            buttonColor: Colors.red,
          ),
      home: ExamplePage(),
    );
  }
}
