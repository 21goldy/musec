import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:just_audio/just_audio.dart';

import '../CustomWidgets/diagonal_chex_design.dart';

class MusicPlayerPage extends StatefulWidget {
  const MusicPlayerPage({super.key});

  @override
  State<MusicPlayerPage> createState() => _MusicPlayerPageState();
}

class _MusicPlayerPageState extends State<MusicPlayerPage> {
  final player = AudioPlayer(); // Create a player

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SafeArea(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () async {
                await player.setUrl(           // Load a URL
                    'http://weirdbox-g3-3500:4533/rest/getSong?id=Q38K8J0TK1QeMVSYh8V79n&u=weirdbox&p=@2314&v=1.16.1&c=myapp');
                player.play();
                print('clicked!');
              }, child:
              Text('play'),),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white70,
                    size: 30,
                  ),
                  Icon(Icons.menu_rounded, color: Colors.white70, size: 30),
                ],
              ),
              SizedBox(height: 50),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  // adjust radius as needed
                  child: Image.network(
                    "https://imgs.search.brave.com/cCkQNdhskP5B_1rLhio_e-wUKoo5_D_SO2M2FsJDfLk/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jLnNh/YXZuY2RuLmNvbS82/OTAvRjEtVGhlLUFs/YnVtLUVuZ2xpc2gt/MjAyNS0yMDI1MDYy/NDA1Mzg1OC01MDB4/NTAwLmpwZw",
                    width: 350, // optional
                    height: 350, // optional
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 85),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    color: Colors.brown.shade900,
                    width: 330,
                    height: 140,
                    padding: const EdgeInsets.all(12),
                    child: CustomPaint(
                      painter: DiagonalChexPainter(
                        lineColor: Colors.white.withOpacity(0.1),
                        lineWidth: 1,
                        cellSize: 40,
                        // spacing: 40,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Text(
                                "00:12",
                                style: TextStyle(color: Colors.white70),
                              ),
                              SizedBox(width: 15),
                              Expanded(
                                child: SliderTheme(
                                  data: SliderTheme.of(context).copyWith(
                                    trackHeight: 4,
                                    thumbShape: RoundSliderThumbShape(
                                      enabledThumbRadius: 0,
                                    ),
                                    overlayShape: RoundSliderOverlayShape(
                                      overlayRadius: 0,
                                    ),
                                  ),
                                  child: Slider(
                                    activeColor: Colors.orangeAccent,
                                    inactiveColor: Colors.white70,
                                    value: 50,
                                    max: 225,
                                    onChanged: (v) {},
                                  ),
                                ),
                              ),
                              SizedBox(width: 15),
                              Text(
                                "03:45",
                                style: TextStyle(color: Colors.white70),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/podcast-solid-full.svg",
                                width: 25,
                                height: 25,
                                color: Colors.white70,
                              ),
                              Wrap(
                                spacing: 20,
                                children: [
                                  SizedBox(width: 10),
                                  SvgPicture.asset(
                                    "assets/icons/backward-solid-full.svg",
                                    width: 25,
                                    height: 25,
                                    color: Colors.white70,
                                  ),
                                  SvgPicture.asset(
                                    "assets/icons/pause-solid-full.svg",
                                    width: 25,
                                    height: 25,
                                    color: Colors.white70,
                                  ),
                                  SvgPicture.asset(
                                    "assets/icons/forward-solid-full.svg",
                                    width: 25,
                                    height: 25,
                                    color: Colors.white70,
                                  ),
                                  SizedBox(width: 10),
                                ],
                              ),
                              SvgPicture.asset(
                                "assets/icons/repeat-solid-full.svg",
                                width: 25,
                                height: 25,
                                color: Colors.white70,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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
