import 'package:musec/UniversalComponents/account_control.dart';

class Album {
  final String id;
  final String title;
  final String artist;
  final String coverUrl;
  final int year;
  final int songCount;

  Album({
    required this.id,
    required this.title,
    required this.artist,
    required this.year,
    required this.songCount, required this.coverUrl,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      title: json['album'] ?? json['title'],
      artist: json['displayAlbumArtist'] ?? json['artist'],
      coverUrl: "http://100.92.42.45:4533/rest/getCoverArt?id=${json['coverArt']}&u=weirdbox&p=@2314&v=1.16.1&c=myapp",
      year: json['year'] ?? 0,
      songCount: json['songCount'] ?? 0,
    );
  }
}

class Song {
  final String id;
  final String title;
  final String artist;
  final String album;
  final String coverUrl;
  final int duration;
  final String url;
  final bool isStarred;

  Song({
    required this.id,
    required this.title,
    required this.artist,
    required this.album,
    required this.duration, required this.url, required this.coverUrl, required this.isStarred,
  });

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      id: json['id'],
      title: json['title'],
      artist: json['displayArtist'] ?? json['artist'],
      album: json['album'],
      duration: json['duration'] ?? 0,
      isStarred: json.containsKey('starred'),
      coverUrl: SubsonicApi.buildUri(
        'getCoverArt',
        extra: {'id': json['coverArt']},
      ).toString(),
      url: SubsonicApi.buildUri(
        'stream',
        extra: {'id': json['id']},
      ).toString(),
    );
  }
}
