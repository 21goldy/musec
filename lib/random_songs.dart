import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:just_audio/just_audio.dart';

class RandomSongsPage extends StatefulWidget {
  const RandomSongsPage({super.key});

  @override
  State<RandomSongsPage> createState() => _RandomSongsPageState();
}

class _RandomSongsPageState extends State<RandomSongsPage> {
  late Future<List<Song>> _futureSongs;
  final AudioPlayer _player = AudioPlayer();
  bool playing = false;
  String? currentSongId;

  Future<List<Song>> fetchRandomSongs() async {
    final uri = Uri.parse(
      'http://100.92.42.45:4533/rest/getRandomSongs?u=weirdbox&p=@2314&v=1.16.1&c=myapp&f=json',
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

    _player.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        setState(() {
          playing = false;
        });
        _player.stop();
      }
    });
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Random Songs')),
      body: FutureBuilder<List<Song>>(
        future: _futureSongs,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: Colors.grey,));
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final songs = snapshot.data!;
            return ListView.builder(
              itemCount: songs.length,
              itemBuilder: (context, index) {
                final song = songs[index];
                var isCurrentSongPlaying = currentSongId == song.id && playing;

                return ListTile(
                  leading: InkWell(
                    splashColor: Colors.transparent,
                    onTap: () async {
                      await _player.setUrl(song.url);
                      if (isCurrentSongPlaying) {
                        _player.pause();
                        setState(() => playing = false);
                      } else {
                        _player.play();
                        setState(() {
                          playing = true;
                          currentSongId = song.id;
                        });
                      }
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.black87,
                      child: isCurrentSongPlaying
                          ? Icon(Icons.pause, color: Colors.white)
                          : Icon(Icons.play_arrow_rounded, color: Colors.white),
                    ),
                  ),
                  title: Text(song.title),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(song.artist),
                      if (isCurrentSongPlaying)
                        StreamBuilder<Duration>(
                          stream: _player.positionStream,
                          builder: (context, snapshot) {
                            final position = snapshot.data ?? Duration.zero;
                            final total = _player.duration ?? Duration.zero;

                            final totalMs = total.inMilliseconds > 0 ? total.inMilliseconds : 1;
                            final positionMs = position.inMilliseconds.clamp(0, totalMs);

                            return SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                trackHeight: 2.0, // thinner progress line
                                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 5.0), // smaller thumb
                                overlayShape: const RoundSliderOverlayShape(overlayRadius: 8.0), // smaller touch area
                                activeTrackColor: Colors.black87,
                                inactiveTrackColor: Colors.grey.shade300,
                                thumbColor: Colors.black87,
                              ),
                              child: Slider(
                                min: 0,
                                max: totalMs.toDouble(),
                                value: positionMs.toDouble(),
                                onChanged: (value) {
                                  _player.seek(Duration(milliseconds: value.toInt()));
                                },
                              ),
                            );
                          },
                        ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class Song {
  final String id;
  final String title;
  final String artist;
  final String album;
  final String url;

  Song({
    required this.id,
    required this.title,
    required this.artist,
    required this.album,
    required this.url,
  });

  factory Song.fromJson(Map<String, dynamic> json) {
    const String baseUrl = 'http://100.92.42.45:4533/rest/stream.view';
    const String username = 'weirdbox';
    const String password = '@2314';
    const String version = '1.16.1';
    const String client = 'myapp';

    final id = json['id']?.toString() ?? '';

    final generatedUrl = id.isNotEmpty
        ? '$baseUrl?id=$id&u=$username&p=$password&v=$version&c=$client'
        : '';

    return Song(
      id: id,
      title: json['title'] ?? '',
      artist: json['artist'] ?? '',
      album: json['album'] ?? '',
      url: generatedUrl,
    );
  }
}
