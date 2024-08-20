import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:readquran/domain/cache_manager.dart';
import 'package:readquran/domain/providers/audio_player_provider.dart';

class AudioPlayerNotifier extends StateNotifier<Duration> {
  final AudioPlayer _audioPlayer;
  Duration? totalDuration;

  AudioPlayerNotifier(this._audioPlayer) : super(Duration.zero) {
    _audioPlayer.positionStream.listen((position) {
      state = position;
    });

    _audioPlayer.durationStream.listen((duration) {
      totalDuration = duration ?? Duration.zero;
      state = state; 
    });

        _audioPlayer.playerStateStream.listen((playerState) {
      if (playerState.processingState == ProcessingState.completed) {
        _onTrackComplete();
      }
    });
  }

  Future<void> play(String url) async {
    await _audioPlayer.setUrl(url);
    final file = await QuranCacheManager().downloadFile(url);
    if (file.path.isNotEmpty) {
      await _audioPlayer.setFilePath(file.path);
    }
    _audioPlayer.play();
  }

  void pause() {
    _audioPlayer.pause();
  }

  void seek(Duration position) {
    _audioPlayer.seek(position);
  }

    void _onTrackComplete() {
    state = totalDuration ?? Duration.zero;
  }
}

final audioPlayerNotifierProvider =
    StateNotifierProvider<AudioPlayerNotifier, Duration>((ref) {
  final player = ref.watch(audioPlayerProvider);
  return AudioPlayerNotifier(player);
});
