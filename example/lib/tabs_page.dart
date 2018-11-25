import 'package:example/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:platty/widgets/button.dart';
import 'package:platty/widgets/tabs.dart';

class TabsPage extends StatefulWidget {
  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  TargetPlatform renderPlatform = TargetPlatform.android;

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navBarFor(title: "Tabs"),
      body: SafeArea(
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  PButton(
                    child: Text("Toggle Platform"),
                    onPressed: () {
                      setState(() {
                        renderPlatform =
                            renderPlatform == TargetPlatform.android
                                ? TargetPlatform.iOS
                                : TargetPlatform.android;
                      });
                    },
                  ),
                  Text('Current Platform $renderPlatform'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: PTabBar(
        backgroundColor: Colors.red,
        activeFixedColor: Colors.white,
        inactiveColor: Colors.grey,
        currentIndex: currentIndex,
        renderPlatform: renderPlatform,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), title: Text("Settings"))
        ],
      ),
    );
  }
}
