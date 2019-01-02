import 'package:example/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:platty/platty.dart';

class SwitchesPage extends StatefulWidget {
  @override
  SwitchesPageState createState() {
    return new SwitchesPageState();
  }
}

class SwitchesPageState extends State<SwitchesPage> {
  var states = [false, false, false];

  _buildSwitch({String title, Widget Function() switchBuilder}) => Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(title),
            ),
            switchBuilder(),
          ],
        ),
      );

  _updateState(int index) {
    setState(() {
      states[index] = !states[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return PScaffold(
      appBar: navBarFor(title: "Switches"),
      backgroundColor: Colors.white,
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              _buildSwitch(
                title: "Platform Switch",
                switchBuilder: () => PSwitch(
                      value: states[0],
                      androidInactiveThumbColor: Colors.grey,
                      activeColor: Colors.red,
                      onChanged: (value) {
                        _updateState(0);
                      },
                    ),
              ),
              _buildSwitch(
                title: "IOS Switch",
                switchBuilder: () => PSwitch(
                      activeColor: Colors.red,
                      renderPlatform: TargetPlatform.iOS,
                      value: states[1],
                      onChanged: (value) {
                        _updateState(1);
                      },
                    ),
              ),
              _buildSwitch(
                title: "Android Switch",
                switchBuilder: () => PSwitch(
                      activeColor: Colors.red,
                      androidInactiveThumbColor: Colors.white,
                      renderPlatform: TargetPlatform.android,
                      value: states[2],
                      onChanged: (value) {
                        _updateState(2);
                      },
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
