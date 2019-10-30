import 'package:example/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:platty/platty.dart';

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
    return PScaffold(
      renderPlatform: TargetPlatform.android,
      appBar: navBarFor(title: "Navigation Bars"),
      child: Column(
        children: <Widget>[
          PNavigationBar(
            iosHeroTag: "iOS1",
            backgroundColor: Colors.red,
            title: Text(
              "Platform",
            ),
            actions: _getActions(),
          ),
          PNavigationBar(
            iosHeroTag: "iOS",
            backgroundColor: Colors.red,
            renderPlatform: TargetPlatform.iOS,
            title: Text(
              "Plain iOS",
            ),
            iosMirrorAndroid: false,
            actions: _getActions(),
          ),
          PNavigationBar(
            iosHeroTag: "iOS2",
            iosPreviousPageTitle: "Back",
            backgroundColor: Colors.red,
            renderPlatform: TargetPlatform.iOS,
            title: Text(
              "iOS Mirror",
            ),
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
              androidBottom: () => PreferredSize(
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
    );
  }
}
