import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'UniversalComponents/account_control.dart';
import 'UniversalComponents/class_models.dart';
import 'UniversalComponents/widgets.dart';

class PlaylistSongsPage extends StatefulWidget {
  const PlaylistSongsPage({super.key, required this.playlistId, required this.title});
  final String playlistId;
  final String title;

  @override
  State<PlaylistSongsPage> createState() => _PlaylistSongsPageState();
}

class _PlaylistSongsPageState extends State<PlaylistSongsPage> {
  late Future<List<Song>> _fetchPlaylistSongs;

  Future<List<Song>> fetchPlaylistSongs() async {
    final uri = SubsonicApi.buildUri(
      'getPlaylist',
      extra: {'id': widget.playlistId}
    );

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final playlistJson =
      jsonData['subsonic-response']['playlist']['entry'] as List;
      return playlistJson.map((e) => Song.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load playlist songs');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchPlaylistSongs = fetchPlaylistSongs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios_new, color: Colors.white),
        ),
        title: Text(widget.title, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder<List<Song>>(
        future: _fetchPlaylistSongs,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.grey),
            );
          }

          final songs = snapshot.data ?? [];

          if (songs.isEmpty) {
            return const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.queue_music_rounded,
                    size: 64,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 12),
                  Text(
                    'No songs in this playlist',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: const TextStyle(color: Colors.redAccent),
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              setState(() {});
            },
            child: ListView.builder(
              itemCount: songs.length,
              itemBuilder: (context, index) {
                return SongTile(song: songs[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
