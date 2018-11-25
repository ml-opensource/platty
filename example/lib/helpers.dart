import 'package:flutter/material.dart';
import 'package:platty/widgets/navigation_bar.dart';

PNavigationBar navBarFor({String title}) => PNavigationBar(
      backgroundColor: Colors.red,
      iconColor: Colors.white,
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
    );
