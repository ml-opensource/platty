import 'package:example/alert_page.dart';
import 'package:example/button_page.dart';
import 'package:example/progress_page.dart';
import 'package:example/sliders_page.dart';
import 'package:example/switches_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:platty/widgets/button.dart';
import 'package:platty/widgets/navigation_bar.dart';

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
                      iosBorderRadius: BorderRadius.circular(8.0),
                      color: Colors.grey,
                      padding: EdgeInsets.all(0.0),
                      renderPlatform: TargetPlatform.iOS,
                      child: Text("Alerts"),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AlertPage()));
                      },
                    ),
                    PButton(
                      androidShape: StadiumBorder(),
                      color: Colors.grey,
                      renderPlatform: TargetPlatform.android,
                      child: Text("Buttons"),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ButtonPage()));
                      },
                    ),
                    PButton(
                      padding: EdgeInsets.all(0.0),
                      color: Colors.grey,
                      renderPlatform: TargetPlatform.iOS,
                      child: Text("Progress"),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProgressPage()));
                      },
                    ),
                    PButton(
                      padding: EdgeInsets.all(8.0),
                      color: Colors.grey,
                      renderPlatform: TargetPlatform.android,
                      child: Text("Sliders"),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SlidersPage()));
                      },
                    ),
                    PButton(
                      padding: EdgeInsets.all(8.0),
                      color: Colors.grey,
                      renderPlatform: TargetPlatform.iOS,
                      child: Text("Switches"),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SwitchesPage()));
                      },
                    )
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
