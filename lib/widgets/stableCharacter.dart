import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StableCharacter extends StatelessWidget{
  final String value;
  final double fontSize;

  const StableCharacter({
    super.key,
    required this.value,
    this.fontSize = 28
  });

  @override
  Widget build(BuildContext context) {
   return
        Text(
          value,
          style: GoogleFonts.lato(fontSize: fontSize),
        );
  }
}