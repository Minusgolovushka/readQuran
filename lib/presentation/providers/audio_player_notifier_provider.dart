import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:readquran/domain/providers/audio_player_provider.dart';
import 'package:readquran/domain/providers/cache_manager_provider.dart';

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

  Future<void> play(String url, WidgetRef ref) async {
    final file = await ref.read(cacheManagerProvider).downloadFile(url);
    if (file.path.isNotEmpty) {
      await _audioPlayer.setFilePath(file.path);
    }else{
      await _audioPlayer.setUrl(url);
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
 // final cacheManager = ref.read(cacheManagerProvider);
  return AudioPlayerNotifier(player);
});

final isPlayingProvider = StateProvider<bool>((ref) => false);