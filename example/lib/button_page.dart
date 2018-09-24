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
                    child: Text("Platform Button"),
                    onPressed: () {},
                  ),
                  PButton(
                    child: Text("Android Button"),
                    renderPlatform: TargetPlatform.android,
                    onPressed: () {},
                  ),
                  PButton(
                    child: Text("iOS Button"),
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
