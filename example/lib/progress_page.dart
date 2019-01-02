import 'package:example/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:platty/platty.dart';

class ProgressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PScaffold(
      backgroundColor: Colors.white,
      appBar: navBarFor(title: "Progress Widgets"),
      child: Container(
        child: Column(
          children: <Widget>[
            _buildProgressItem(
              title: "Platform Activity",
              activityBuilder: () => PActivityIndicator(
                    androidValueColor: AlwaysStoppedAnimation(Colors.red),
                  ),
            ),
            _buildProgressItem(
              title: "iOS Activity",
              activityBuilder: () => PActivityIndicator(
                    renderPlatform: TargetPlatform.iOS,
                  ),
            ),
            _buildProgressItem(
                title: "Android Activity",
                activityBuilder: () => PActivityIndicator(
                      renderPlatform: TargetPlatform.android,
                      androidValueColor: AlwaysStoppedAnimation(Colors.red),
                    ))
          ],
        ),
      ),
    );
  }

  _buildProgressItem(
          {@required String title,
          @required Widget Function() activityBuilder}) =>
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(title),
            ),
            activityBuilder(),
          ],
        ),
      );
}
