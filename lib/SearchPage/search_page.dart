import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musec/CustomWidgets/custom_form_field.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchbarController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(child: 
      Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50, bottom: 10),
            child: TextFormField(
              cursorColor: Colors.white,
              style: GoogleFonts.raleway(
                color: Colors.white,
                letterSpacing: 0.5,
                fontSize: 16,
              ),
              decoration: InputDecoration(
                hintText: "Search here",
                hintStyle: GoogleFonts.raleway(
                  color: Colors.white,
                  letterSpacing: 0.5,
                  fontSize: 18,
                ),
                fillColor: Colors.transparent,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                  borderSide: BorderSide(color: Colors.white),
                ),
                suffixIcon: SvgPicture.asset(
                  "assets/svgs/thin_search.svg",
                ),

                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 14,
                ),
              ),
            ),
          )

        ],
      ),),
    );
  }
}
