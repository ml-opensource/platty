import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:platty/widgets/navigation_bar.dart';
import 'package:platty/widgets/slider.dart';

class SlidersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PNavigationBar(
        title: Text("Sliders"),
      ),
      body: SafeArea(
          child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            _buildSlider(
                title: "Platform Slider",
                sliderBuilder: () => PSlider(
                      value: 0.5,
                      onChanged: (value) {},
                    )),
            _buildSlider(
                title: "IOS Slider",
                sliderBuilder: () => PSlider(
                      value: 0.5,
                      renderPlatform: TargetPlatform.iOS,
                      onChanged: (value) {},
                    )),
            _buildSlider(
                title: "Android Slider",
                sliderBuilder: () => PSlider(
                      value: 0.5,
                      renderPlatform: TargetPlatform.android,
                      onChanged: (value) {},
                    )),
          ],
        ),
      )),
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
