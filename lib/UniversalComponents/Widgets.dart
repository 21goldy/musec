import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../AudioPlayer/audio_player_provider.dart';
import '../UniversalComponents/ClassModels.dart';

class AlbumTile extends ConsumerWidget {
  final Album album;

  const AlbumTile({
    super.key,
    required this.album,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: Image.network(
        "http://100.92.42.45:4533/rest/getCoverArt"
            "?id=${album.coverArt}"
            "&u=weirdbox&p=@2314&v=1.16.1&c=myapp",
        width: 45,
        fit: BoxFit.cover,
      ),
      title: Text(
        album.title,
        style: const TextStyle(color: Colors.white),
      ),
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

  const SongTile({
    super.key,
    required this.song,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: Image.network(
        "http://100.92.42.45:4533/rest/getCoverArt"
            "?id=${song.coverArt}"
            "&u=weirdbox&p=@2314&v=1.16.1&c=myapp",
        width: 45,
        fit: BoxFit.cover,
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
        ref.read(audioPlayerProvider.notifier).play(
          songId: song.id,
          url:
          "http://100.92.42.45:4533/rest/stream"
              "?id=${song.id}"
              "&u=weirdbox&p=@2314&v=1.16.1&c=myapp", title: song.title, artist: song.artist, coverArt: song.coverArt,
        );
      },
    );
  }
}

