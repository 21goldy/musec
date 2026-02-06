import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'UniversalComponents/account_control.dart';
import 'UniversalComponents/class_models.dart';
import 'UniversalComponents/widgets.dart';

class DailyMix10 extends StatefulWidget {
  const DailyMix10({super.key});

  @override
  State<DailyMix10> createState() => _DailyMix10State();
}

class _DailyMix10State extends State<DailyMix10> {
  late Future<List<Song>> _futureSongs;

  Future<List<Song>> fetchRandomSongs() async {
    final uri = SubsonicApi.buildUri(
      'getRandomSongs',
    );

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final songsJson =
          jsonData['subsonic-response']['randomSongs']['song'] as List;
      return songsJson.map((e) => Song.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load songs');
    }
  }

  @override
  void initState() {
    super.initState();
    _futureSongs = fetchRandomSongs();
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
        title: Text('Daily Mix 10', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder<List<Song>>(
        future: _futureSongs,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.grey),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final songs = snapshot.data!;
            return ListView.builder(
              itemCount: songs.length,
              itemBuilder: (context, index) {
                final song = songs[index];
                return SongTile(song: song);
              },
            );
          }
        },
      ),
    );
  }
}
