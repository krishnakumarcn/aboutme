import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_view.dart';

class AppView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: Color(0xff202022),
        primaryColor: Color(0xff171717),
        scaffoldBackgroundColor: Color(0xff171717),
        highlightColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          brightness: Brightness.dark,
          centerTitle: false,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          color: Colors.transparent,
          titleTextStyle: TextStyle(color: Colors.white),
          textTheme:
              GoogleFonts.spaceMonoTextTheme(Theme.of(context).textTheme),
        ),
        inputDecorationTheme: InputDecorationTheme(
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          contentPadding: EdgeInsets.all(8),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xff14142B), width: 1)),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xffA0A3BD), width: 1)),
        ),
        textTheme: TextTheme(
          headline1: GoogleFonts.gothicA1(
              color: Colors.white,
              fontSize: 97,
              fontWeight: FontWeight.w300,
              letterSpacing: -1.5),
          headline2: GoogleFonts.gothicA1(
              color: Colors.white,
              fontSize: 61,
              fontWeight: FontWeight.w300,
              height: 1,
              letterSpacing: -0.5),
          headline3: GoogleFonts.gothicA1(
              color: Colors.white, fontSize: 48, fontWeight: FontWeight.w400),
          headline4: GoogleFonts.gothicA1(
              color: Colors.white,
              fontSize: 34,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.25),
          headline5: GoogleFonts.gothicA1(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.w400),
          headline6: GoogleFonts.roboto(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.15),
          subtitle1: GoogleFonts.gothicA1(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.15),
          subtitle2: GoogleFonts.gothicA1(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.1),
          bodyText1: GoogleFonts.gothicA1(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.5),
          bodyText2: GoogleFonts.gothicA1(
              color: Color(0xff949495),
              fontSize: 14,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.25),
          button: GoogleFonts.gothicA1(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.25),
          caption: GoogleFonts.gothicA1(
              color: Color(0xff4d4d4d),
              fontSize: 12,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.4),
          overline: GoogleFonts.gothicA1(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.w400,
              letterSpacing: 1.5),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          ),
        ),
      ),
      home: Scaffold(body: Home()),
    );
  }
}
