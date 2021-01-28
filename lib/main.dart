import 'package:aboutme/views/home/home_desktop_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:url_strategy/url_strategy.dart';

import 'app/locator.dart';

Future main() async {
  await ThemeManager.initialise();
  setupLocator();

  setPathUrlStrategy();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      defaultThemeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        backgroundColor: Colors.blue[700],
        accentColor: Colors.yellow[700],
        primaryColor: Colors.blue[700],
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.yellow[700],
        ),
      ),
      lightTheme: ThemeData(
        brightness: Brightness.light,
        backgroundColor: Color(0xffff4083),
        accentColor: Color(0xff009a8c),
        primaryColor: Color(0xffff4083),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Color(0xff009a8c),
        ),
      ),
      builder: (context, regularTheme, darkTheme, themeMode) => MaterialApp(
        title: '@krishnakumarcn',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: GoogleFonts.varela().fontFamily,
        ),
        home: HomePage(),
      ),
    );
  }
}
