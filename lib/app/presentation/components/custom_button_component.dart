import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButtonComponent extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  const CustomButtonComponent(
      {Key? key, required this.label, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        primary: Theme.of(context).primaryColor,
        padding: const EdgeInsets.symmetric(vertical: 15),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
      onPressed: onPressed,
      child: FittedBox(
          child: Text(
        label,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          fontFamily: GoogleFonts.balooBhai2().fontFamily,
        ),
      )),
    );
  }
}
