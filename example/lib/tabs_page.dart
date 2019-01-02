import 'package:example/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:platty/platty.dart';

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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  platformWrap(
                    context,
                    renderCupertino: (context, child) => Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: child,
                        ),
                    child: PButton(
                      child: Text("Toggle Tabs Platform"),
                      color: Colors.red,
                      onPressed: () {
                        setState(() {
                          renderPlatform =
                              renderPlatform == TargetPlatform.android
                                  ? TargetPlatform.iOS
                                  : TargetPlatform.android;
                        });
                      },
                    ),
                  ),
                  Text('Current Platform $renderPlatform'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: PTabBar(
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
