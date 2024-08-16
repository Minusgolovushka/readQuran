import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:readquran/domain/providers/ayah_list_provider.dart';
import 'package:readquran/presentation/providers/audio_player_notifier_provider.dart';
import 'package:readquran/presentation/providers/current_surah_screen_state_provider.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';

class CurrentSurahScreen extends ConsumerWidget {
  final int number;
  final String name;

  const CurrentSurahScreen({super.key, required this.number, required this.name});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final audioPlayerNotifier = ref.watch(audioPlayerNotifierProvider.notifier);
    final currentPosition = ref.watch(audioPlayerNotifierProvider);
    final ayahsAsyncValue = ref.watch(ayahListProvider(number));
    final currentAyahIndex = ref.watch(currentAyahIndexProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: ayahsAsyncValue.when(
        data: (ayahs) {
          return ListView.builder(
            itemCount: ayahs.length,
            itemBuilder: (context, index) {
              final ayah = ayahs[index];
              return Card(
                color: index == currentAyahIndex ? Colors.green[50] : Colors.white,
                margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                child: ListTile(
                  leading: Text(ayah.numberInSurah.toString()),
                  contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                  title: Text(
                    ayah.text,
                    style: const TextStyle(fontSize: 24),
                  ),
                  subtitle: Text(
                    ayah.translation,
                    style: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                  ),
                  onTap: () async {
                    ref.read(currentAyahIndexProvider.notifier).state = index;
                    await audioPlayerNotifier.play(ayah.audio);
                  },
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
      bottomNavigationBar: buildBottomAppBar(context, ref, currentPosition),
    );
  }

  BottomAppBar buildBottomAppBar(BuildContext context, WidgetRef ref, Duration currentPosition) {
    final audioPlayerNotifier = ref.watch(audioPlayerNotifierProvider.notifier);
    final totalDuration = ref.watch(audioPlayerNotifierProvider.notifier).totalDuration ?? Duration.zero;
    final isPlaying = ref.watch(isPlayingProvider);
    final currentAyahIndex = ref.watch(currentAyahIndexProvider);

    return BottomAppBar(
      height: 150,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ProgressBar(
            progress: currentPosition,
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
                    audioPlayerNotifier.play(ref.read(ayahListProvider(number)).value![currentAyahIndex - 1].audio);
                  }
                },
              ),
              IconButton(
                icon: isPlaying ? const Icon(Icons.pause) : const Icon(Icons.play_arrow),
                onPressed: () {
                  if (isPlaying) {
                    audioPlayerNotifier.pause();
                    ref.read(isPlayingProvider.notifier).state = false;
                  } else {
                    audioPlayerNotifier.play(ref.read(ayahListProvider(number)).value![currentAyahIndex].audio);
                    ref.read(isPlayingProvider.notifier).state = true;
                  }
                },
              ),
              IconButton(
                icon: const Icon(Icons.skip_next),
                onPressed: () {
                  if (currentAyahIndex < ref.read(ayahListProvider(number)).value!.length - 1) {
                    ref.read(currentAyahIndexProvider.notifier).state++;
                    audioPlayerNotifier.play(ref.read(ayahListProvider(number)).value![currentAyahIndex + 1].audio);
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
