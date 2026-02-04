import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:musec/UniversalComponents/ClassModels.dart';
import '../UniversalComponents/Widgets.dart';
import 'package:musec/AudioPlayer/audio_player_provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchbarController = TextEditingController();

  List<Album> albums = [];
  List<Song> songs = [];
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    List<Album> parseAlbums(Map<String, dynamic> data) {
      final albums =
          data['subsonic-response']['searchResult2']['album'] as List?;
      return albums?.map((e) => Album.fromJson(e)).toList() ?? [];
    }

    List<Song> parseSongs(Map<String, dynamic> data) {
      final songs = data['subsonic-response']['searchResult2']['song'] as List?;
      return songs?.map((e) => Song.fromJson(e)).toList() ?? [];
    }

    Future<void> performSearch(String query) async {
      if (query.isEmpty) return;

      setState(() => isLoading = true);

      final uri = Uri.parse(
        'http://100.92.42.45:4533/rest/search2?&query=${searchbarController.text}&u=weirdbox&p=@2314&v=1.16.1&c=myapp&f=json',
      );

      final http.Response res = await http.get(uri);

      if (res.statusCode == 200) {
        final Map<String, dynamic> response =
            json.decode(res.body) as Map<String, dynamic>;

        setState(() {
          albums = parseAlbums(response);
          songs = parseSongs(response);
          isLoading = false;
        });
      } else {
        setState(() => isLoading = false);
        debugPrint("Search failed: ${res.statusCode}");
      }
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50, bottom: 10),
              child: TextFormField(
                controller: searchbarController,
                cursorColor: Colors.white,
                style: GoogleFonts.raleway(
                  color: Colors.white,
                  letterSpacing: 0.5,
                  fontSize: 16,
                ),
                decoration: InputDecoration(
                  hintText: "Search here",
                  hintStyle: GoogleFonts.raleway(
                    color: Colors.white,
                    letterSpacing: 0.5,
                    fontSize: 18,
                  ),
                  fillColor: Colors.transparent,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () => performSearch(searchbarController.text),
                    icon: SvgPicture.asset("assets/svgs/thin_search.svg"),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 14,
                  ),
                ),
              ),
            ),
            Expanded(
              child: isLoading
                  ? const Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    )
                  : ListView(
                      children: [
                        if (albums.isNotEmpty) ...[
                          sectionTitle("Albums"),
                          ...albums.map(
                                (album) => AlbumTile(
                              album: album,
                            ),
                          ),
                        ],
                        if (songs.isNotEmpty) ...[
                          sectionTitle("Songs"),
                          ...songs.map(
                                (song) => SongTile(
                              song: song,),
                          ),                        ],
                        if (albums.isEmpty && songs.isEmpty)
                          const Padding(
                            padding: EdgeInsets.only(top: 50),
                            child: Center(
                              child: Text(
                                "No results found",
                                style: TextStyle(color: Colors.white54),
                              ),
                            ),
                          ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        title,
        style: GoogleFonts.raleway(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget albumTile(Album album) {
    return ListTile(
      leading: Image.network(
        "http://100.92.42.45:4533/rest/getCoverArt?id=${album.coverArt}&u=weirdbox&p=@2314&v=1.16.1&c=myapp",
        width: 45,
        fit: BoxFit.cover,
      ),
      title: Text(album.title, style: const TextStyle(color: Colors.white)),
      subtitle: Text(
        album.artist,
        style: const TextStyle(color: Colors.white70),
      ),
      onTap: () {
        // Open album page
      },
    );
  }

  Widget songTile(Song song) {
    return ListTile(
      leading: Image.network(
          "http://100.92.42.45:4533/rest/getCoverArt?id=${song.coverArt}&u=weirdbox&p=@2314&v=1.16.1&c=myapp"),
      title: Text(
        song.title.replaceAll(" - PagalNew", ""),
        style: const TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        song.artist,
        style: const TextStyle(color: Colors.white70),
      ),
      onTap: () {
        // Play song
      },
    );
  }
}
