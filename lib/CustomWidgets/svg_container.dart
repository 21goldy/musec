import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SvgContainer extends StatelessWidget {
  final Color color;
  final bool isDottedContainer;
  final String containerText;
  final VoidCallback? onTap;

  const SvgContainer({
    super.key,
    required this.color,
    required this.containerText,
    required this.isDottedContainer,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          child: SizedBox(
            width: 125,
            height: 125,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  isDottedContainer
                      ? "assets/svgs/dotted_container.svg"
                      : "assets/svgs/playlist_container.svg",
                  color: isDottedContainer ? Colors.white : color,
                  fit: BoxFit.contain, // 👈 prevents distortion
                ),

                Padding(
                  padding: const EdgeInsets.all(14),
                  child: Text(
                    containerText,
                    maxLines: 2, // 👈 important
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: isDottedContainer
                        ? GoogleFonts.raleway(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5,
                      color: Colors.white,
                    )
                        : GoogleFonts.chewy(
                      fontSize: 18,
                      letterSpacing: 1,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
