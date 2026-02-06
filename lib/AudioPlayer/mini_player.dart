import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'audio_player_provider.dart';

class MiniPlayer extends ConsumerWidget {
  const MiniPlayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(audioPlayerProvider);
    final notifier = ref.read(audioPlayerProvider.notifier);
    final isPlaying = state.isPlaying;


    if (state.currentSongId == null) {
      return const SizedBox.shrink();
    }

    return Container(
      height: 70,
      width: 395,
      decoration: const BoxDecoration(
        color: Color(0xFF7de7ab),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
      ),
      child: Row(
        children: [
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.title ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.raleway(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  state.artist ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.raleway(
                    color: Colors.black,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: notifier.hasPrevious ? notifier.skipPrevious : null,
            icon: const Icon(
              Icons.skip_previous_rounded,
              size: 30,
              color: Colors.black,
            ),
          ),

          IconButton(
            icon: Icon(
              isPlaying
                  ? Icons.pause_circle_filled_rounded
                  : Icons.play_circle_filled_rounded,
              size: 42,
              color: Colors.black,
            ),
            onPressed: () {
              if (isPlaying) {
                notifier.pause();
              } else {
                notifier.resume();
              }
            },
          ),

          IconButton(
            onPressed: notifier.hasNext ? notifier.skipNext : null,
            icon: const Icon(
              Icons.skip_next_rounded,
              size: 30,
              color: Colors.black,
            ),
          ),
        const SizedBox(width: 8),
        ],
      ),
    );
  }
}
