import 'package:example/alert_page.dart';
import 'package:example/button_page.dart';
import 'package:example/navigation_bar_page.dart';
import 'package:example/progress_page.dart';
import 'package:example/sliders_page.dart';
import 'package:example/switches_page.dart';
import 'package:example/tabs_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:platty/widgets/button.dart';
import 'package:platty/widgets/navigation_bar.dart';
import 'package:platty/widgets/routing.dart';

class ExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PNavigationBar(
        title: Text("Example"),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 160.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    PButton(
                      padding: EdgeInsets.all(0.0),
                      child: Text("Alerts"),
                      onPressed: () {
                        Navigator.of(context).push(PlatformRoute.of(context,
                            builder: (context) => AlertPage()));
                      },
                    ),
                    PButton(
                      padding: EdgeInsets.all(0.0),
                      child: Text("Buttons"),
                      onPressed: () {
                        Navigator.push(
                            context,
                            PlatformRoute.of(context,
                                builder: (context) => ButtonPage()));
                      },
                    ),
                    PButton(
                      padding: EdgeInsets.all(0.0),
                      child: Text("Navigation"),
                      onPressed: () {
                        Navigator.push(
                            context,
                            PlatformRoute.of(context,
                                builder: (context) => NavigationBarPage()));
                      },
                    ),
                    PButton(
                      padding: EdgeInsets.all(0.0),
                      child: Text("Progress"),
                      onPressed: () {
                        Navigator.push(
                            context,
                            PlatformRoute.of(context,
                                builder: (context) => ProgressPage()));
                      },
                    ),
                    PButton(
                      padding: EdgeInsets.all(0.0),
                      child: Text("Sliders"),
                      onPressed: () {
                        Navigator.push(
                            context,
                            PlatformRoute.of(context,
                                builder: (context) => SlidersPage()));
                      },
                    ),
                    PButton(
                      padding: EdgeInsets.all(0.0),
                      child: Text("Switches"),
                      onPressed: () {
                        Navigator.push(
                            context,
                            PlatformRoute.of(context,
                                builder: (context) => SwitchesPage()));
                      },
                    ),
                    PButton(
                      padding: EdgeInsets.all(0.0),
                      child: Text("Tabs"),
                      onPressed: () {
                        Navigator.push(
                            context,
                            PlatformRoute.of(context,
                                builder: (context) => TabsPage()));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
