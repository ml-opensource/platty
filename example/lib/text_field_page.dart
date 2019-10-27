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
        child: ListView(
          children: <Widget>[
            buildSectionTitle("Standard Inputs"),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: PTheme.android(
                      PTextField(
                        decoration: basicInputDecoration("Android"),
                      ),
                    ),
                  ),
                  Flexible(
                    child: PTheme.ios(
                      PTextField(
                        decoration: basicInputDecoration("iOS"),
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
                        decoration: outlineInputDecoration("Android"),
                      ),
                    ),
                  ),
                  Flexible(
                    child: PTheme.ios(
                      PTextField(
                        decoration: outlineInputDecoration("iOS"),
                      ),
                    ),
                  )
                ],
              ),
            ),
            buildSectionTitle("Disabled Inputs"),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: PTheme.android(
                      PTextField(
                        enabled: false,
                        decoration: basicInputDecoration("Android"),
                      ),
                    ),
                  ),
                  Flexible(
                    child: PTheme.ios(
                      PTextField(
                        enabled: false,
                        decoration: basicInputDecoration("iOS"),
                      ),
                    ),
                  )
                ],
              ),
            ),
            buildSectionTitle("Error Inputs"),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: PTheme.android(
                      PTextField(
                        decoration: basicInputDecoration("Android",
                            errorText: "Invalid Input"),
                      ),
                    ),
                  ),
                  Flexible(
                    child: PTheme.ios(
                      PTextField(
                        decoration: basicInputDecoration("iOS",
                            errorText: "Invalid Input"),
                      ),
                    ),
                  )
                ],
              ),
            ),
            buildSectionTitle("Helper Max Inputs"),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: PTheme.android(
                      PTextField(
                        maxLength: 10,
                        decoration: basicInputDecoration("Android",
                            helperText: "10 Chars"),
                      ),
                    ),
                  ),
                  Flexible(
                    child: PTheme.ios(
                      PTextField(
                        maxLength: 10,
                        decoration:
                            basicInputDecoration("iOS", helperText: "10 Chars"),
                      ),
                    ),
                  )
                ],
              ),
            ),
            buildSectionTitle("Obscure Inputs"),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: PTheme.android(
                      PTextField(
                        obscureText: true,
                        decoration: basicInputDecoration("Android"),
                      ),
                    ),
                  ),
                  Flexible(
                    child: PTheme.ios(
                      PTextField(
                        obscureText: true,
                        decoration: basicInputDecoration("iOS"),
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

  InputDecoration outlineInputDecoration(String hintText) => InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.all(8.0),
      );

  InputDecoration basicInputDecoration(
    String hintText, {
    String errorText,
    String helperText,
  }) =>
      InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.all(8.0),
        errorText: errorText,
        helperText: helperText,
      );

  Padding buildSectionTitle(String title) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          title,
          style: TextStyle(fontSize: 20.0),
        ),
      );
}
