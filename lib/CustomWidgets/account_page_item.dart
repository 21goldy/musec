import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountItem extends StatelessWidget {
  final String text;

  const AccountItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 12, bottom: 12),
      child: InkWell(
        onTap: () {
          // navigation can go here
        },
        child: Text(
          text,
          style: GoogleFonts.raleway(
            fontSize: 27,
            letterSpacing: 1,
            fontWeight: FontWeight.w300,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
