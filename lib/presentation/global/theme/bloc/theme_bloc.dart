import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:covid_app/presentation/global/theme/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:covid_app/utils/constants/preferences_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './bloc.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  //static const String DARK_THEME = "ThemeBloc_DARK_THEME";

  static ThemeBloc _instance;

  SharedPreferences prefs;

  ThemeBloc._() {
    _loadSettings();
  }

  static ThemeBloc get instance {
    if (_instance == null) {
      _instance = ThemeBloc._();
    }
    return _instance;
  }

  @override
  ThemeState get initialState => ThemeState(
        materialThemeData: materialThemeData[AppTheme.Light],
        cupertinoThemeData: cupertinoThemeData[AppTheme.Light],
      );

  @override
  Stream<ThemeState> mapEventToState(
    ThemeEvent event,
  ) async* {
    if (event is ThemeChanged) {
      bool darkTheme = event.theme == AppTheme.Dark;

      if (darkTheme) {
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Colors.black,
          systemNavigationBarDividerColor: null,
          systemNavigationBarIconBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ));
      } else {
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Colors.white,
          systemNavigationBarDividerColor: Colors.black,
          systemNavigationBarIconBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
        ));
      }

      // if (darkTheme) {
      //   SystemChrome.setSystemUIOverlayStyle(
      //       SystemUiOverlayStyle(systemNavigationBarColor: Colors.grey));
      // } else {
      //   SystemChrome.setSystemUIOverlayStyle(
      //       SystemUiOverlayStyle(systemNavigationBarColor: Colors.white));
      // }
      await _saveSettings(darkTheme);
      yield ThemeState(
          materialThemeData: materialThemeData[event.theme],
          cupertinoThemeData: cupertinoThemeData[event.theme]);
    }
  }

  _loadSettings() async {
    if (prefs == null) prefs = await SharedPreferences.getInstance();
    bool _darkTheme = prefs.getBool(PrefsConstants.DARK_THEME) ?? true;
    add(ThemeChanged(theme: _darkTheme ? AppTheme.Dark : AppTheme.Light));
    return _darkTheme;
  }

  _saveSettings(bool darkTheme) async {
    if (prefs == null) prefs = await SharedPreferences.getInstance();
    await prefs.setBool(PrefsConstants.DARK_THEME, darkTheme);
  }
}
