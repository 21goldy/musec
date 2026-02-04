class Album {
  final String id;
  final String title;
  final String artist;
  final String coverArt;
  final int year;
  final int songCount;

  Album({
    required this.id,
    required this.title,
    required this.artist,
    required this.coverArt,
    required this.year,
    required this.songCount,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      title: json['album'] ?? json['title'],
      artist: json['displayAlbumArtist'] ?? json['artist'],
      coverArt: json['coverArt'] ?? '',
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
  final String coverArt;
  final int duration;

  Song({
    required this.id,
    required this.title,
    required this.artist,
    required this.album,
    required this.coverArt,
    required this.duration,
  });

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      id: json['id'],
      title: json['title'],
      artist: json['displayArtist'] ?? json['artist'],
      album: json['album'],
      coverArt: json['coverArt'] ?? '',
      duration: json['duration'] ?? 0,
    );
  }
}