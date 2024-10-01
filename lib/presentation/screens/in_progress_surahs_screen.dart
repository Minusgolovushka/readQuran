import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:readquran/domain/providers/surah_list_notifier.dart';
import 'package:readquran/presentation/widgets/bottom_nav_bar.dart';

@RoutePage()
class InProgressSurahsScreen extends ConsumerWidget {
  const InProgressSurahsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final surahState = ref.watch(surahListNotifierProvider);
    final inProgressSurahs = surahState.inProgressSurahs;

    return Scaffold(
      appBar: AppBar(title: const Text('In Progress Surahs')),
      body: inProgressSurahs.isEmpty
          ? const Center(child: Text('Нет сур в процессе.'))
          : ListView.builder(
              itemCount: inProgressSurahs.length,
              itemBuilder: (context, index) {
                final surah = surahState.surahs.firstWhere(
                  (s) => s.number == inProgressSurahs[index],
                );
                return ListTile(
                  title: Text(surah.name),
                  subtitle: Text(surah.englishName),
                );
              },
            ),
             bottomNavigationBar: const BottomNavBar(),
    );
  }
}