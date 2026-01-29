import 'package:flutter/material.dart';

class PlaylistSongsPage extends StatefulWidget {
  const PlaylistSongsPage({super.key, required this.playlistId, required this.title});
  final String playlistId;
  final String title;

  @override
  State<PlaylistSongsPage> createState() => _PlaylistSongsPageState();
}

class _PlaylistSongsPageState extends State<PlaylistSongsPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
