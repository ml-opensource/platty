import 'package:example/alert_page.dart';
import 'package:example/button_page.dart';
import 'package:example/helpers.dart';
import 'package:example/navigation_bar_page.dart';
import 'package:example/progress_page.dart';
import 'package:example/sliders_page.dart';
import 'package:example/switches_page.dart';
import 'package:example/tabs_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:platty/platty.dart';

class ExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PScaffold(
      appBar: navBarFor(title: "Platform-Adapting Widgets Example"),
      backgroundColor: Colors.white,
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
                  _buildNavButton(context,
                      title: "Alerts", page: (context) => AlertPage()),
                  _buildNavButton(context,
                      title: "Buttons", page: (context) => ButtonPage()),
                  _buildNavButton(context,
                      title: "Navigation",
                      page: (context) => NavigationBarPage()),
                  _buildNavButton(context,
                      title: "Progress", page: (context) => ProgressPage()),
                  _buildNavButton(context,
                      title: "Sliders", page: (context) => SlidersPage()),
                  _buildNavButton(context,
                      title: "Switches", page: (context) => SwitchesPage()),
                  _buildNavButton(context,
                      title: "Tabs", page: (context) => TabsPage()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavButton(
    BuildContext context, {
    @required String title,
    @required WidgetBuilder page,
  }) {
    return platformWrap(
      context,
      child: PButton(
        padding: EdgeInsets.all(0.0),
        child: Text(title),
        onPressed: () {
          Navigator.push(context, PlatformRoute.of(context, builder: page));
        },
      ),
      renderCupertino: (context, child) => Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: child,
          ),
    );
  }
}
