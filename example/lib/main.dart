import 'package:example/example_page.dart';
import 'package:flutter/material.dart';
import 'package:platty/platform_app.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return PlatformApp(
      title: 'Flutter Demo',
      androidTheme: () => ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
            // counter didn't reset back to zero; the application is not restarted.
            primarySwatch: Colors.lightBlue,
            bottomAppBarColor: Colors.red,
            buttonColor: Colors.red,
          ),
      renderPlatform: TargetPlatform.android,
      home: ExamplePage(),
    );
  }
}
