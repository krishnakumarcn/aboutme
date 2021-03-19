import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app/configure_nonweb.dart'
    if (dart.library.html) 'app/configure_web.dart';

void main() {
  configureApp();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        accentColor: Color(0xff88bdbc),
        primaryColor: Color(0xff254e58),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          brightness: Brightness.light,
          centerTitle: false,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          color: Colors.transparent,
          titleTextStyle: TextStyle(color: Colors.black),
          textTheme: GoogleFonts.firaSansTextTheme(Theme.of(context).textTheme),
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
          headline1: GoogleFonts.firaSans(
              fontSize: 97, fontWeight: FontWeight.w300, letterSpacing: -1.5),
          headline2: GoogleFonts.firaSans(
              fontSize: 61, fontWeight: FontWeight.w300, letterSpacing: -0.5),
          headline3:
              GoogleFonts.firaSans(fontSize: 48, fontWeight: FontWeight.w400),
          headline4: GoogleFonts.firaSans(
              fontSize: 34, fontWeight: FontWeight.w400, letterSpacing: 0.25),
          headline5:
              GoogleFonts.firaSans(fontSize: 24, fontWeight: FontWeight.w400),
          headline6: GoogleFonts.firaSans(
              fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15),
          subtitle1: GoogleFonts.firaSans(
              fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
          subtitle2: GoogleFonts.firaSans(
              fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
          bodyText1: GoogleFonts.firaSans(
              fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
          bodyText2: GoogleFonts.firaSans(
              fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
          button: GoogleFonts.firaSans(
              fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
          caption: GoogleFonts.firaSans(
              fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
          overline: GoogleFonts.firaSans(
              fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          ),
        ),
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text(
              "test",
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(color: Colors.red),
            ),
          ),
          body: Container()),
    );
  }
}
