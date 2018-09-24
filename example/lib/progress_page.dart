import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:platty/widgets/navigation_bar.dart';
import 'package:platty/widgets/progress.dart';

class ProgressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PNavigationBar(
        title: Text("Progress Widgets"),
      ),
      body: SafeArea(
          child: Container(
        child: Column(
          children: <Widget>[
            _buildProgressItem(
              title: "Platform Activity",
              activityBuilder: () => PActivityIndicator(),
            ),
            _buildProgressItem(
              title: "iOS Activity",
              activityBuilder: () => PActivityIndicator(
                    renderPlatform: TargetPlatform.iOS,
                  ),
            ),
            _buildProgressItem(
                title: "Android Activity",
                activityBuilder: () => Container(
                      color: Colors.indigo,
                      child: PActivityIndicator(
                        renderPlatform: TargetPlatform.android,
                        androidValueColor: AlwaysStoppedAnimation(Colors.white),
                      ),
                    ))
          ],
        ),
      )),
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
