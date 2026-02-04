import 'package:flutter_riverpod/legacy.dart';
import 'package:just_audio/just_audio.dart';

final audioPlayerProvider =
StateNotifierProvider<AudioPlayerNotifier, AudioPlayerState>(
      (ref) => AudioPlayerNotifier(),
);

class AudioPlayerState {
  final bool isPlaying;
  final String? currentSongId;
  final String? title;
  final String? artist;
  final String? coverArt;

  AudioPlayerState({
    this.isPlaying = false,
    this.currentSongId,
    this.title,
    this.artist,
    this.coverArt,
  });

  AudioPlayerState copyWith({
    bool? isPlaying,
    String? currentSongId,
    String? title,
    String? artist,
    String? coverArt,
  }) {
    return AudioPlayerState(
      isPlaying: isPlaying ?? this.isPlaying,
      currentSongId: currentSongId ?? this.currentSongId,
      title: title ?? this.title,
      artist: artist ?? this.artist,
      coverArt: coverArt ?? this.coverArt,
    );
  }
}


class AudioPlayerNotifier extends StateNotifier<AudioPlayerState> {
  AudioPlayerNotifier() : super(AudioPlayerState());

  final AudioPlayer _player = AudioPlayer();

  AudioPlayer get player => _player;

  Future<void> play({
    required String url,
    required String songId,
    required String title,
    required String artist,
    required String coverArt,
  }) async {
    if (state.currentSongId != songId) {
      await _player.setUrl(url);
    }

    await _player.play();

    state = state.copyWith(
      isPlaying: true,
      currentSongId: songId,
      title: title,
      artist: artist,
      coverArt: coverArt,
    );
  }

  Future<void> pause() async {
    await _player.pause();
    state = state.copyWith(isPlaying: false);
  }

  Future<void> stop() async {
    await _player.stop();
    state = state.copyWith(
      isPlaying: false,
      currentSongId: null,
    );
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }
}
