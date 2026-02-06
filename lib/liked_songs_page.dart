import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'UniversalComponents/account_control.dart';
import 'UniversalComponents/class_models.dart';
import 'UniversalComponents/widgets.dart';

class LikedSongsPage extends StatefulWidget {
  const LikedSongsPage({super.key});

  @override
  State<LikedSongsPage> createState() => _LikedSongsPageState();
}

class _LikedSongsPageState extends State<LikedSongsPage> {
  late Future<List<Song>> _futureStarredSongs;

  Future<List<Song>> fetchStarredSongs() async {
    final uri = SubsonicApi.buildUri(
      'getStarred2',
    );

    final response = await http.get(uri);
    final data = jsonDecode(response.body);

    final songs =
    data['subsonic-response']?['starred2']?['song'] as List?;

    return songs?.map((e) => Song.fromJson(e)).toList() ?? [];
  }

  @override
  void initState() {
    super.initState();
    _futureStarredSongs = fetchStarredSongs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios_new, color: Colors.white),
        ),
        title: Text('Liked Songs', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder<List<Song>>(
        future: _futureStarredSongs,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.grey),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final songs = snapshot.data!;
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
          }
        },
      ),
    );
  }
}
