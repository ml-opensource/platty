import 'package:example/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:platty/widgets/navigation_bar.dart';

class NavigationBarPage extends StatelessWidget {
  _getActions() => <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.map),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.textsms),
          onPressed: () {},
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navBarFor(title: "Navigation Bars"),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            PNavigationBar(
              iosHeroTag: "iOS1",
              backgroundColor: Colors.red,
              title: Text("Platform"),
              actions: _getActions(),
              iconColor: Colors.white,
            ),
            PNavigationBar(
              iosHeroTag: "iOS",
              iconColor: Colors.white,
              backgroundColor: Colors.red,
              leading: IconButton(
                icon: Icon(CupertinoIcons.back),
                onPressed: () {},
              ),
              renderPlatform: TargetPlatform.iOS,
              title: Text("iOS"),
              actions: _getActions(),
            ),
            PNavigationBar(
              iosHeroTag: "iOS2",
              iosPreviousPageTitle: "Back",
              iconColor: Colors.white,
              backgroundColor: Colors.red,
              renderPlatform: TargetPlatform.iOS,
              title: Text("iOS"),
              actions: _getActions(),
            ),
            PNavigationBar(
              backgroundColor: Colors.red,
              leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.maybePop(context);
                  }),
              title: Text(
                "Android",
                style: TextStyle(color: Colors.white),
              ),
              renderPlatform: TargetPlatform.android,
              actions: _getActions(),
              iconColor: Colors.white,
            ),
            SizedBox(
              height: 120.0,
              child: PNavigationBar(
                backgroundColor: Colors.red,
                leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.maybePop(context);
                    }),
                title: Text(
                  "Android with bottom",
                  style: TextStyle(color: Colors.white),
                ),
                renderPlatform: TargetPlatform.android,
                actions: _getActions(),
                iconColor: Colors.white,
                androidBottom: PreferredSize(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Bottom"),
                  ),
                  preferredSize: Size.fromHeight(30.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
