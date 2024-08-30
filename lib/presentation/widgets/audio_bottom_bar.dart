import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:readquran/domain/providers/ayah_list_notifier.dart';
import 'package:readquran/presentation/providers/audio_player_notifier_provider.dart';
import 'package:readquran/presentation/providers/current_surah_screen_state_provider.dart';

class AudioBottomBar extends ConsumerWidget {
  const AudioBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final audioPlayerNotifier = ref.watch(audioPlayerNotifierProvider.notifier);
    final ayahs = ref.watch(ayahListNotifierProvider);
    final totalDuration = audioPlayerNotifier.totalDuration ?? Duration.zero;
    final currentAyahIndex = ref.watch(currentAyahIndexProvider);
    final isPlaying = ref.watch(isPlayingProvider);

    ref.listen<Duration>(audioPlayerNotifierProvider, (previous, current) {
      if (current == totalDuration && currentAyahIndex < ayahs.length - 1) {
        ref.read(currentAyahIndexProvider.notifier).state++;
        audioPlayerNotifier.play(ayahs[currentAyahIndex + 1].audio, ref);
      }
    });

    return BottomAppBar(
      height: 100,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ProgressBar(
            progressBarColor: Theme.of(context).primaryColor,
            thumbColor: Theme.of(context).primaryColor,
            thumbRadius: 5.0,
            timeLabelTextStyle: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 12,
            ),
            progress: ref.watch(audioPlayerNotifierProvider),
            total: totalDuration,
            onSeek: (position) {
              audioPlayerNotifier.seek(position);
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(Icons.skip_previous),
                onPressed: () {
                  if (currentAyahIndex > 0) {
                    ref.read(currentAyahIndexProvider.notifier).state--;
                    audioPlayerNotifier.play(ayahs[currentAyahIndex - 1].audio, ref);
                  }
                },
              ),
              IconButton(
                icon: isPlaying ? const Icon(Icons.pause) : const Icon(Icons.play_arrow),
                onPressed: () {
                  if (isPlaying) {
                    audioPlayerNotifier.pause();
                    ref.read(isPlayingProvider.notifier).state = false;
                  } else if (ayahs.isNotEmpty) {
                    audioPlayerNotifier.play(ayahs[currentAyahIndex].audio, ref);
                    ref.read(isPlayingProvider.notifier).state = true;
                  }
                },
              ),
              IconButton(
                icon: const Icon(Icons.skip_next),
                onPressed: () {
                  if (currentAyahIndex < ayahs.length - 1) {
                    ref.read(currentAyahIndexProvider.notifier).state++;
                    audioPlayerNotifier.play(ayahs[currentAyahIndex + 1].audio, ref);
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
