import 'package:example/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:platty/platty.dart';

class ButtonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PScaffold(
      appBar: navBarFor(title: "Buttons"),
      backgroundColor: Colors.white,
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              PButton(
                color: Colors.red,
                child: Text(
                  "Platform Button",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {},
              ),
              PButton(
                color: Colors.red,
                child: Text(
                  "Android Button",
                  style: TextStyle(color: Colors.white),
                ),
                renderPlatform: TargetPlatform.android,
                onPressed: () {},
              ),
              PButton(
                color: Colors.red,
                child: Text(
                  "iOS Button",
                  style: TextStyle(color: Colors.white),
                ),
                renderPlatform: TargetPlatform.iOS,
                onPressed: () {},
              ),
              PFlatButton(
                child: Text("Flat Platform Button"),
                onPressed: () {},
              ),
              PTheme.android(
                PFlatButton(
                  child: Text("Android Flat Button"),
                  onPressed: () {},
                ),
              ),
              PTheme.ios(
                PFlatButton(
                  child: Text("iOS Flat Button"),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
