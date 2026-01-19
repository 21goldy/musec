import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musec/random_songs.dart';

class SvgContainer extends StatelessWidget {
  final Color color;
  final bool isDottedContainer;
  final String containerText;

  const SvgContainer({
    super.key,
    required this.color,
    required this.containerText,
    required this.isDottedContainer,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => RandomSongsPage(
                title: containerText,
              ),
            ),
          );
        },
        child: SizedBox(
          width: 125,
          height: 125,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // SVG background
              SvgPicture.asset(
                isDottedContainer
                    ? "assets/svgs/dotted_container.svg"
                    : "assets/svgs/playlist_container.svg",
                color: isDottedContainer ? Colors.white : color,
                fit: BoxFit.fill,
              ),

              // Text on top
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  containerText,
                  textAlign: TextAlign.center,
                  style: isDottedContainer
                      ? GoogleFonts.raleway(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.5,
                          color: Colors.white,
                        )
                      : GoogleFonts.chewy(
                          fontSize: 23,
                          fontWeight: FontWeight.w100,
                          letterSpacing: 1,
                          color: Colors.white,
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
