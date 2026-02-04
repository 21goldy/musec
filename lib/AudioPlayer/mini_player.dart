import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'audio_player_provider.dart';

class MiniPlayer extends ConsumerWidget {
  const MiniPlayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerState = ref.watch(audioPlayerProvider);

    if (playerState.currentSongId == null) {
      return const SizedBox.shrink();
    }

    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: Color(0xFF7de7ab),
        border: Border(
          top: BorderSide(color: Colors.white12),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 30,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  playerState.title ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.raleway(
                      color: Colors.black, fontSize: 13, fontWeight: FontWeight.w500
                  ),
                ),
                Text(
                  playerState.artist ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.raleway(
                      color: Colors.black, fontSize: 10, fontWeight: FontWeight.w500
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.favorite_outline_rounded, color: Colors.black, size: 18,),),
              IconButton(onPressed: (){}, icon: Icon(Icons.skip_previous_rounded, color: Colors.black, size: 30,),),
              IconButton(
                icon: playerState.isPlaying ? Icon(Icons.pause_circle_filled_rounded, color: Colors.black, size: 42,): Icon(Icons.play_circle_filled_rounded, color: Colors.black, size: 42,),
                onPressed: (){
                  final notifier =
                  ref.read(audioPlayerProvider.notifier);

                  playerState.isPlaying
                      ? notifier.pause()
                      : notifier.player.play();
                },
              ),
              IconButton(onPressed: (){}, icon: Icon(Icons.skip_next_rounded, color: Colors.black, size: 30,),),
              IconButton(onPressed: (){}, icon: Icon(Icons.add_circle_outline_rounded, color: Colors.black, size: 18,),),
            ],
          ),
        ],
      ),
    );
  }
}
