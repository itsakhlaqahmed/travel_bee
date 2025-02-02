import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontTheme {
  static const logoFont = GoogleFonts.cedarvilleCursive;
  static const double titleSize = 24;
  static const double subHeadingSize = 24;
  static const subHeadingStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.grey,
    height: 1.2
  );

  // Headline style
  static TextStyle get headline => GoogleFonts.cedarvilleCursive(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      );

  // Subheadline style
  static TextStyle get subheadline => GoogleFonts.cedarvilleCursive(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: Colors.black87,
      );

  // Body text style
  static TextStyle get body => GoogleFonts.cedarvilleCursive(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: Colors.black54,
      );

  // Caption style
  static TextStyle get caption => GoogleFonts.cedarvilleCursive(
        fontSize: 12,
        fontWeight: FontWeight.w300,
        color: Colors.black38,
      );
}
