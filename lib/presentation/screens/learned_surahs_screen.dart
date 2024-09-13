import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:readquran/domain/providers/surah_list_notifier.dart';

@RoutePage()
class LearnedSurahsScreen extends ConsumerWidget {
  const LearnedSurahsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Получаем текущее состояние
    final surahState = ref.watch(surahListNotifierProvider);
    final learnedSurahs = surahState.learnedSurahs;

    return Scaffold(
      appBar: AppBar(title: const Text('Learned Surahs')),
      body: learnedSurahs.isEmpty
          ? const Center(child: Text('Нет изученных сур.'))
          : ListView.builder(
              itemCount: learnedSurahs.length,
              itemBuilder: (context, index) {
                // Доступ к элементам списка сур через surahState.surahs
                final surah = surahState.surahs.firstWhere(
                  (s) => s.number == learnedSurahs[index],
                );
                return ListTile(
                  title: Text(surah.name),
                  subtitle: Text(surah.englishName),
                );
              },
            ),
    );
  }
}