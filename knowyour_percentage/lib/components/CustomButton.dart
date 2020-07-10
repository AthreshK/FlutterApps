import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:knowyour_percentage/constants.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final Function onTap;

  const CustomButton({@required this.label, this.onTap});

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.all(30),
        elevation: 20,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        color: accent_color,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: GoogleFonts.kanit(fontSize: 25, color: back_dark),
          ),
        ),
      ),
    );
  }
}
