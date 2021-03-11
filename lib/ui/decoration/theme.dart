import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme(BuildContext _) {
  return ThemeData(
    brightness: Brightness.light,
    textTheme: GoogleFonts.manropeTextTheme(
      Theme.of(_).textTheme,
    ),
  );
}

ThemeData darkTheme(BuildContext _) {
  return ThemeData(
    brightness: Brightness.dark,
    textTheme: GoogleFonts.manropeTextTheme(
      Theme.of(_).textTheme,
    ),
  );
}
