import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:key2iq_quiz/main_screen/main_screen.dart';

void main() {
  //For hiding the toolbar
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MainScreen(),

  ));
}

