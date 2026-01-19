import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DropRoomPage extends StatefulWidget {
  const DropRoomPage({super.key});

  @override
  State<DropRoomPage> createState() => _DropRoomPageState();
}

class _DropRoomPageState extends State<DropRoomPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 70,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 250,
                  height: 250,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // SVG background
                      SvgPicture.asset(
                        "assets/svgs/dotted_container.svg",
                        color: Colors.white,
                        fit: BoxFit.fill,
                      ),

                      // Text on top
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            SizedBox(width: 35),
                            Icon(Icons.edit, color: Colors.white,),
                            Text(
                              " Create Room",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.raleway(
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                                letterSpacing: 0.5,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Text(
              "Create private rooms to chat and listen to music altogether",
              style: GoogleFonts.raleway(fontSize: 10, letterSpacing: 1, color: Colors.grey),
            ),
            SizedBox(
              height: 80,
            ),
            Text("or", style: GoogleFonts.raleway(fontSize: 30, color: Colors.white,)),
            SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add, size: 30, color: Colors.white,),
                Text(" Join Room", style: GoogleFonts.raleway(fontSize: 33, letterSpacing: 1, fontWeight: FontWeight.w200, color: Colors.white,)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
