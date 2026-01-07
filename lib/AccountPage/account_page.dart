import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 170,
              ),
              customTextField("My Library"),
              customTextField("Manage Account"),
              customTextField("Help"),
              customTextField("Contact Us"),
              customTextField("Log Out"),
            ],
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Text("All rights reserved <goldy>", style: GoogleFonts.raleway(
                fontWeight: FontWeight.w300,
                fontSize: 10,
                color: Colors.white,
              ),),
            ),
          )
        ],
      ),),
    );
  }
  
  Widget customTextField (String txt) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 12, bottom: 12),
      child: Text(txt, style: GoogleFonts.raleway(
        fontSize: 27,
        letterSpacing: 1,
        fontWeight: FontWeight.w300,
        color: Colors.white,
      ),),
    );
  }
}
