import 'package:flutter/material.dart';

// INPUT BOX STYLING

const textInputDecoration = InputDecoration(
  
  fillColor: Colors.white,
  filled: true,
  counterText: "",
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Color(0xFF242B40),
      width: 2.0),
  ),
  focusedBorder: OutlineInputBorder(
  borderSide: BorderSide(
    color: Color(0xFF576986),
    width: 2.0),
  ),
);


// ADD FUNDS INPUT BOX STYLING

const textAddFundsDecoration = InputDecoration(
  
  
  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white,
      width: 0.0),
  ),
  focusedBorder: OutlineInputBorder(
  borderSide: BorderSide(
    color: Colors.white,
    width: 2.0),
  ),
);

// TITLE STYLING

final islesTitleStyle = TextStyle(
  color: Colors.white,
  //fontFamily: 'CM Sans Serif',
  fontSize: 26.0,
  letterSpacing: 1.2,
  fontWeight: FontWeight.bold,
  height: 1.4,
);

// USER APP WELCOME PAGE TITLE STYLING

final islesLoginTitleStyle = TextStyle(
  color: Colors.white,
  //fontFamily: 'CM Sans Serif',
  fontSize: 20.0,
  letterSpacing: 1.2,
  fontWeight: FontWeight.w400,
  height: 1.4,
);

// USER APP WELCOME PAGE SUBTITLE STYLING

final islesSubtitleStyle = TextStyle(
  color: Colors.black,
  fontSize: 18.0,
  height: 1.2,
);