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
      appBar: PNavigationBar(
        title: Text("Navigation Bars"),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            PNavigationBar(
              backgroundColor: Colors.red,
              title: Text("Platform"),
              actions: _getActions(),
              iconColor: Colors.white,
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
          ],
        ),
      ),
    );
  }
}
