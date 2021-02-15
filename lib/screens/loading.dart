import 'package:flutter/material.dart';
import 'package:flutter_app_skeleton/config/palette.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


// USER APP LOADING PAGE

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Opacity(
        child: Container(
          color: Theme.of(context).primaryColor,
          child: Center(
            child: SpinKitFoldingCube(
              color: Palette.islesPaleYellow,
              size: 50.0,
            ),
          ),
        ),
        opacity:0.75
    );
  }
}