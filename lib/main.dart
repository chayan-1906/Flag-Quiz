import 'package:flag_quiz/ui/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final ThemeData _appTheme = _buildAppTheme();

ThemeData _buildAppTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
      brightness: Brightness.dark,
      accentColor: Colors.amber[800],
      primaryColor: Colors.green,
      scaffoldBackgroundColor: Colors.red,
      backgroundColor: Colors.amber,
      textTheme: _appTextTheme(base.textTheme)
      // TextTheme(body1: TextStyle(fontSize: 16.9, color: Colors.white),),
      );
}

TextTheme _appTextTheme(TextTheme base) {
  return base
      .copyWith(
          headline: base.headline!.copyWith(fontWeight: FontWeight.w500),
          title: base.title!.copyWith(fontSize: 18.0),
          caption: base.caption!
              .copyWith(fontWeight: FontWeight.w400, fontSize: 14.0),
          button: base.button!.copyWith(),
          body1: base.body1!.copyWith(
              fontSize: 16.9, fontFamily: "Lato", color: Colors.white))
      .apply(
        fontFamily: "Lato",
        displayColor: Colors.amber,
        //bodyColor: Colors.red
      );
}

void main() {
  runApp(MaterialApp(
    theme: _appTheme,
    // theme: ThemeData(
    //   brightness: Brightness.dark,
    //   primaryColor: Colors.lightBlue[800],
    //   textTheme: TextTheme(
    //     headline: TextStyle(
    //       fontSize: 34,
    //       fontWeight: FontWeight.bold,
    //     ),
    //     body1: TextStyle(
    //       fontSize: 16.9,
    //       color: Colors.white
    //     ),
    //   ),
    // ),
    home: QuizApp(),
  ));
}
