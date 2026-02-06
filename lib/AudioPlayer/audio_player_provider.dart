import 'package:flutter_riverpod/legacy.dart';
import 'package:just_audio/just_audio.dart';
import '../UniversalComponents/class_models.dart';

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

  const AudioPlayerState({
    this.isPlaying = false,
    this.currentSongId,
    this.title,
    this.artist,
    this.coverArt,
  });

  factory AudioPlayerState.initial() => const AudioPlayerState();

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
  final AudioPlayer _player = AudioPlayer();
  final List<Song> _queue = [];
  int _currentIndex = -1;

  AudioPlayerNotifier() : super(AudioPlayerState.initial()) {
    _player.playerStateStream.listen((playerState) {
      final playing = playerState.playing;

      if (state.isPlaying != playing) {
        state = state.copyWith(isPlaying: playing);
      }

      if (playerState.processingState == ProcessingState.completed) {
        skipNext();
      }
    });
  }

  AudioPlayer get player => _player;

  Future<void> playSong(Song song) async {
    // 🔁 Same song tapped again
    if (state.currentSongId == song.id) {
      if (!_player.playing) {
        await _player.play(); // resume
      }
      return;
    }

    final index = _queue.indexWhere((s) => s.id == song.id);

    if (index == -1) {
      _queue.add(song);
      _currentIndex = _queue.length - 1;
    } else {
      _currentIndex = index;
    }

    // update UI immediately
    state = state.copyWith(
      currentSongId: song.id,
      title: song.title,
      artist: song.artist,
      coverArt: song.coverUrl,
    );

    await _player.setUrl(song.url);
    await _player.play();
  }

  void addToQueue(Song song) {
    if (_queue.any((s) => s.id == song.id)) return;
    _queue.add(song);
  }

  void addToQueueNext(Song song) {
    if (_queue.any((s) => s.id == song.id)) return;

    // if nothing is playing yet
    if (_currentIndex < 0) {
      _queue.add(song);
      _currentIndex = 0;
      return;
    }

    _queue.insert(_currentIndex + 1, song);
  }


  Future<void> resume() async {
    await _player.play();
    state = state.copyWith(
      isPlaying: true,
    );
  }

  Future<void> pause() async {
    await _player.pause();
    state = state.copyWith(
      isPlaying: false,
    );
  }

  Future<void> stop() async {
    await _player.stop();
    _currentIndex = -1;
    _queue.clear();
    state = AudioPlayerState.initial();
  }

  Future<void> skipNext() async {
    if (!hasNext) return;
    _currentIndex++;
    await playSong(_queue[_currentIndex]);
  }

  Future<void> skipPrevious() async {
    if (!hasPrevious) return;
    _currentIndex--;
    await playSong(_queue[_currentIndex]);
  }

  bool get hasNext => _currentIndex >= 0 && _currentIndex < _queue.length - 1;
  bool get hasPrevious => _currentIndex > 0;

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }
}
