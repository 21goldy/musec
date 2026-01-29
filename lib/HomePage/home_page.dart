import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musec/CustomWidgets/svg_container.dart';
import 'package:musec/CustomWidgets/playlist_grid.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Text(
                    "Browse by  ",
                    style: GoogleFonts.raleway(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5,
                      color: Colors.white70,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.elliptical(20, 80),
                      bottomLeft: Radius.elliptical(30, 40),
                      bottomRight: Radius.elliptical(20, 50),
                      topRight: Radius.elliptical(50, 20),
                    ),
                    child: Container(
                      height: 45,
                      width: 100,
                      color: const Color(0xFFa3f2ea),
                      child: Center(
                        child: Text(
                          "genre",
                          style: GoogleFonts.raleway(
                            letterSpacing: 1,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const PlaylistGrid(),
          ],
        ),
      ),
    );
  }
}

