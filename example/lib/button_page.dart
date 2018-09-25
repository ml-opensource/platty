import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:platty/widgets/button.dart';
import 'package:platty/widgets/navigation_bar.dart';

class ButtonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PNavigationBar(
        title: Text("Buttons"),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Column(
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
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
