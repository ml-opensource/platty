import 'package:example/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:platty/platty.dart';

class SlidersPage extends StatefulWidget {
  @override
  SlidersPageState createState() {
    return new SlidersPageState();
  }
}

class SlidersPageState extends State<SlidersPage> {
  final List<double> values = [0.0, 0.0, 0.0];

  _setValue(int index, {double value}) {
    setState(() {
      values[index] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PScaffold(
      backgroundColor: Colors.white,
      appBar: navBarFor(title: "Sliders"),
      child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            _buildSlider(
                title: "Platform Slider",
                sliderBuilder: () => PSlider(
                      value: values[0],
                      activeColor: Colors.red,
                      onChanged: (value) {
                        _setValue(0, value: value);
                      },
                    )),
            _buildSlider(
                title: "IOS Slider",
                sliderBuilder: () => PSlider(
                      value: values[1],
                      activeColor: Colors.red,
                      renderPlatform: TargetPlatform.iOS,
                      onChanged: (value) {
                        _setValue(1, value: value);
                      },
                    )),
            _buildSlider(
                title: "Android Slider",
                sliderBuilder: () => PSlider(
                      value: values[2],
                      activeColor: Colors.red,
                      renderPlatform: TargetPlatform.android,
                      onChanged: (value) {
                        _setValue(2, value: value);
                      },
                    )),
          ],
        ),
      ),
    );
  }

  Padding _buildSlider(
          {@required String title,
          @required Widget Function() sliderBuilder}) =>
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(title),
            ),
            Expanded(
              child: sliderBuilder(),
            ),
          ],
        ),
      );
}
