import 'package:example/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:platty/platty.dart';

class AlertPage extends StatelessWidget {
  _buildPAlertDialog(BuildContext context) {
    return PAlertDialog(
      title: Text("Sample Alert"),
      content:
          Text("I can adapt based on target platform defaults, PTheme wrapper, "
              "or individual render platform overrides."),
      actions: <Widget>[
        PFlatButton(
          child: Text("Ok"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PScaffold(
      appBar: navBarFor(title: "Alerts"),
      backgroundColor: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32.0),
            child: Column(
              children: <Widget>[
                PTheme.ios(
                  PButton(
                    padding: EdgeInsets.all(8.0),
                    child: Text("iOS Alert"),
                    onPressed: () {
                      showPlatformDialog(
                        context: context,
                        builder: (context) =>
                            PTheme.ios(_buildPAlertDialog(context)),
                      );
                    },
                  ),
                ),
                PTheme.android(
                  PButton(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Android Alert"),
                      onPressed: () {
                        showPlatformDialog(
                            context: context,
                            builder: (context) =>
                                PTheme.android(_buildPAlertDialog(context)));
                      }),
                ),
                PButton(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Platform Alert"),
                  onPressed: () {
                    showPlatformDialog(
                        context: context,
                        builder: (context) => _buildPAlertDialog(context));
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
