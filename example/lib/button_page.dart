import 'package:example/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:platty/platty.dart';

class ButtonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PScaffold(
      appBar: navBarFor(title: "Buttons"),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                buildTitleLabel("Android"),
                buildTitleLabel("iOS"),
              ],
            ),
            buildButtonRow(
                androidButtonText: "Normal", iosButtonText: "Normal"),
            buildButtonRow(
              androidButtonText: "Disabled",
              iosButtonText: "Disabled",
              disabledColor: Colors.red.withAlpha(150),
            ),
            buildFlatButtonRow(
              iosButtonText: "Flat",
              androidButtonText: "Flat",
            ),
            buildFlatButtonRow(
              androidButtonText: "Flat Disabled",
              iosButtonText: "Flat Disabled",
              isDisabled: true,
            )
          ],
        ),
      ),
    );
  }

  Row buildFlatButtonRow(
          {String androidButtonText,
          String iosButtonText,
          bool isDisabled = false}) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          buildExpandedButton(
            child: PTheme.android(
              PFlatButton(
                padding: EdgeInsets.all(8.0),
                child: Text(androidButtonText),
                onPressed: !isDisabled ? () {} : null,
              ),
            ),
          ),
          buildExpandedButton(
            isLeft: false,
            child: PTheme.ios(
              PFlatButton(
                padding: EdgeInsets.all(8.0),
                child: Text(iosButtonText),
                onPressed: !isDisabled ? () {} : null,
              ),
            ),
          ),
        ],
      );

  buildTitleLabel(String text) => Expanded(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: TextStyle(fontSize: 16.0),
            ),
          ),
        ),
      );

  buildButtonRow(
          {String iosButtonText,
          String androidButtonText,
          Color disabledColor}) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          buildExpandedButton(
              child: PButton(
            color: Colors.red,
            padding: EdgeInsets.all(8.0),
            child: Text(
              androidButtonText,
              style: TextStyle(color: Colors.white),
            ),
            renderPlatform: TargetPlatform.android,
            onPressed: disabledColor == null ? () {} : null,
          )),
          buildExpandedButton(
            isLeft: false,
            child: PButton(
              color: Colors.red,
              padding: EdgeInsets.all(8.0),
              child: Text(
                iosButtonText,
                style: TextStyle(color: Colors.white),
              ),
              renderPlatform: TargetPlatform.iOS,
              onPressed: disabledColor == null ? () {} : null,
            ),
          ),
        ],
      );

  Expanded buildExpandedButton({Widget child, bool isLeft = true}) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
            left: isLeft ? 8.0 : 4.0, right: isLeft ? 4.0 : 8.0),
        child: child,
      ),
    );
  }
}
