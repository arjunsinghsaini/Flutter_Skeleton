import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_skeleton/screens/HomePage.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () => handleScreenNavigation(context));
    return Container(color: Colors.brown, child: Icon(
      Icons.flight,
    ));
  }

  handleScreenNavigation(BuildContext context) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => HomePage(),
    ));
  }
}
