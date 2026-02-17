import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Animateddigits extends StatelessWidget{
  final String value;
  final double fontSize;
  final bool? working;

  const Animateddigits({
    super.key,
    required this.value,
    this.working,
    this.fontSize = 32,
  });

  Widget build(BuildContext context){
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 700),
      switchInCurve: Curves.easeOutCubic,
      switchOutCurve: Curves.easeInCubic,
      transitionBuilder: (child, animation) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: Offset(0, -0.5),
            end: Offset(0, 0),
          ).animate(animation),
          child: FadeTransition(
            opacity: CurvedAnimation(parent: animation, curve: const Interval(0.7, 1, curve: Curves.easeOut)),
            child: child,
          ),
        );
      },
      child: Text(
        value,
        key: ValueKey(value),
        style: GoogleFonts.lato(
          fontSize: fontSize,
          color: switch (working) {
            true => Colors.red,
            false => Colors.green,
            null => Colors.black12
          }),
        
      ),
    );

  }
}