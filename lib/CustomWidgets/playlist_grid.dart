import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:musec/UniversalComponents/account_control.dart';
import '../daily_mix.dart';
import '../liked_songs_page.dart';
import '../playlist_songs_page.dart';
import 'color_generator.dart';
import 'svg_container.dart';

class PlaylistGrid extends StatefulWidget {
  const PlaylistGrid({super.key});

  @override
  State<PlaylistGrid> createState() => _PlaylistGridState();
}

class _PlaylistGridState extends State<PlaylistGrid> {
  late Future<List<Playlist>> _playlistFuture;
  List<Color> pastelColors = [];

  @override
  void initState() {
    super.initState();
    _playlistFuture = fetchPlaylists();
  }

  Future<List<Playlist>> fetchPlaylists() async {
    final response = await http.get(
      SubsonicApi.buildUri('getPlaylists')
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to load playlists');
    }

    final decoded = json.decode(response.body);
    final playlistsJson =
    decoded['subsonic-response']['playlists']['playlist'] as List;

    final playlists =
    playlistsJson.map((e) => Playlist.fromJson(e)).toList();

    return playlists;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Playlist>>(
      future: _playlistFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator(color: Colors.grey,));
        }

        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }

        final playlists = snapshot.data!;

        final List<GridItem> gridItems = [
          GridItem(
            id: 'liked',
            title: 'Liked Songs',
            isDotted: true,
            color: Colors.white,
          ),
          GridItem(
            id: 'daily10',
            title: 'Daily 10 for You',
            isDotted: false,
            color: GridTileColors.byIndex(0),
          ),

          ...playlists.asMap().entries.map(
                (entry) {
              final index = entry.key + 1; // offset after fixed items
              final p = entry.value;

              return GridItem(
                id: p.id,
                title: p.name,
                isDotted: false,
                color: GridTileColors.byIndex(index),
              );
            },
          ),
        ];

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1,
          ),
          itemCount: gridItems.length,
          itemBuilder: (context, index) {
            final item = gridItems[index];

            return SvgContainer(
              isDottedContainer: item.id == 'liked',
              color: item.color,
            containerText: item.title,
              onTap: () {
                if (item.id == 'liked') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const LikedSongsPage(),
                    ),
                  );
                } else if (item.id == 'daily10') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const DailyMix10(),
                    ),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PlaylistSongsPage(
                        playlistId: item.id,
                        title: item.title,
                      ),
                    ),
                  );
                }
              },
            );
          },
        );
      },
    );
  }
}

class GridItem {
  final String id;
  final String title;
  final bool isDotted;
  final Color color;

  GridItem({
    required this.id,
    required this.title,
    required this.isDotted,
    required this.color,
  });
}

class Playlist {
  final String id;
  final String name;
  final int songCount;
  final String? coverArt;
  final bool isPublic;

  Playlist({
    required this.id,
    required this.name,
    required this.songCount,
    required this.isPublic,
    this.coverArt,
  });

  factory Playlist.fromJson(Map<String, dynamic> json) {
    return Playlist(
      id: json['id'],
      name: json['name'],
      songCount: json['songCount'] ?? 0,
      isPublic: json['public'] ?? false,
      coverArt: json['coverArt'],
    );
  }
}
