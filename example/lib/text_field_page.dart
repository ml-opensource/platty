import 'package:example/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:platty/platty.dart';

class TextFieldPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PScaffold(
      appBar: navBarFor(title: "Text Field"),
      backgroundColor: Colors.white,
      child: Container(
        child: Column(
          children: <Widget>[
            buildSectionTitle("Standard Inputs"),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: PTheme.android(
                      PTextField(
                        decoration: InputDecoration(
                          hintText: "Android",
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: PTheme.ios(
                      PTextField(
                        decoration: InputDecoration(
                          hintText: "iOS",
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            buildSectionTitle("Outline Inputs"),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: PTheme.android(
                      PTextField(
                        decoration: getInputDecoration("Android"),
                      ),
                    ),
                  ),
                  Flexible(
                    child: PTheme.ios(
                      PTextField(
                        decoration: getInputDecoration("iOS"),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration getInputDecoration(String hintText) => InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.all(8.0),
      );

  Padding buildSectionTitle(String title) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          title,
          style: TextStyle(fontSize: 20.0),
        ),
      );
}
