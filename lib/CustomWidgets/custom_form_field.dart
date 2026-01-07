import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  const CustomFormField({
    super.key,
    required this.hintText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: TextFormField(
        controller: controller,
        style: GoogleFonts.raleway(
            letterSpacing: 1,
            fontSize: 20,
            color: Colors.white
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.raleway(
            letterSpacing: 1,
            fontSize: 20,
            color: Colors.white
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
      ),
    );
  }
}
