import 'package:covid_app/presentation/global/theme/theme_data/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final material = ThemeData(
  primarySwatch: Colors.blue,
  accentColor: Colors.blueAccent,
  brightness: Brightness.light,
  fontFamily: 'Montserrat',
  //canvasColor: Colors.white,
  appBarTheme: AppBarTheme(
    elevation: 1,
    color: Colors.white,
    iconTheme: IconThemeData(color: Colors.white)
  ),
  primaryIconTheme: IconThemeData(color: Colors.grey[900], opacity: 0.50),
  primaryTextTheme: TextTheme(
    title: TextStyle(
      color: Colors.grey[900],
    ),
    headline: HeadingSmall.copyWith(color: Colors.grey[900]),
    body1: BodyStyle1.copyWith(color: Colors.grey[900]),
  ),
);

final cupertino = CupertinoThemeData(
  brightness: Brightness.light,
);
