import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../AudioPlayer/audio_player_provider.dart';
import '../UniversalComponents/class_models.dart';

class AlbumTile extends ConsumerWidget {
  final Album album;

  const AlbumTile({super.key, required this.album});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: Image.network(album.coverUrl, width: 45, fit: BoxFit.cover),
      title: Text(album.title, style: const TextStyle(color: Colors.white)),
      subtitle: Text(
        album.artist,
        style: const TextStyle(color: Colors.white70),
      ),
      onTap: () {
        // 👉 Decide album behavior here
        // Example 1: Open album page
        // Navigator.push(...);

        // Example 2 (optional): auto-play first song of album
        // ref.read(audioPlayerProvider.notifier).play(...);
      },
    );
  }
}

class SongTile extends ConsumerWidget {
  final Song song;

  const SongTile({super.key, required this.song});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: Image.network(song.coverUrl, width: 45, fit: BoxFit.cover),
      trailing: PopupMenuButton<String>(
        color: Colors.black54,
        icon: const Icon(Icons.more_vert),
        onSelected: (value) {
          final notifier = ref.read(audioPlayerProvider.notifier);

          switch (value) {
            case 'add_to_favourite':

              // Todo: Add logic here to make the add to favourite thing work
              final wasStarred = song.isStarred;
              try {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.black54,
                    content: Text(
                      wasStarred
                          ? 'Removed from favourites'
                          : 'Added to favourites',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Colors.black54,
                    content: Text(
                      'Failed to update favourites',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              }
              break;


            case 'add_queue':
              notifier.addToQueue(song);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.black54,
                  content: Text(
                    'Added to queue',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
              break;

            case 'play_next':
              notifier.addToQueueNext(song);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.black54,
                  content: Text(
                    'Will play next',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
              break;
          }
        },
        itemBuilder: (context) => [
          const PopupMenuItem(
            value: 'add_to_favourite',
            child: Row(
              children: [
                Icon(Icons.queue_music, size: 18, color: Colors.white70),
                SizedBox(width: 8),
                Text(
                  'Add to favourite',
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
          const PopupMenuItem(
            value: 'add_queue',
            child: Row(
              children: [
                Icon(Icons.queue_music, size: 18, color: Colors.white70),
                SizedBox(width: 8),
                Text('Add to queue', style: TextStyle(color: Colors.white70)),
              ],
            ),
          ),
          const PopupMenuItem(
            value: 'play_next',
            child: Row(
              children: [
                Icon(Icons.skip_next, size: 18, color: Colors.white70),
                SizedBox(width: 8),
                Text('Play next', style: TextStyle(color: Colors.white70)),
              ],
            ),
          ),
        ],
      ),
      title: Text(
        song.title.replaceAll(" - PagalNew", ""),
        style: const TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        song.artist,
        style: const TextStyle(color: Colors.white70),
      ),
      onTap: () {
        ref.read(audioPlayerProvider.notifier).playSong(song);
      },
    );
  }
}
