import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:readquran/domain/app_router.gr.dart';
import 'package:readquran/domain/providers/surah_list_notifier.dart';
import 'package:readquran/presentation/widgets/bottom_nav_bar.dart';

@RoutePage()
class LearnedSurahsScreen extends ConsumerWidget {
  const LearnedSurahsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final surahState = ref.watch(surahListNotifierProvider);
    final learnedSurahs = surahState.learnedSurahs;

    return Scaffold(
      appBar: AppBar(title: Text('Learned Surahs: ${surahState.learnedSurahs.length}')),
      body: learnedSurahs.isEmpty
          ? const Center(child: Text('Нет изученных сур.'))
          : ListView.builder(
              itemCount: learnedSurahs.length,
              itemBuilder: (context, index) {
                final surah = surahState.surahs.firstWhere(
                  (s) => s.number == learnedSurahs[index],
                );
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: Text(surah.number.toString(), style: Theme.of(context).textTheme.titleMedium,),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_outline),
                      onPressed: () {ref.read(surahListNotifierProvider.notifier).toggleLearnedSurah(surah.number);},
                    ),
                    title: Text(surah.name, style: Theme.of(context).textTheme.bodyLarge,),
                    subtitle: Text(surah.englishName, style: Theme.of(context).textTheme.bodyMedium,),
                    onTap: () {context.router.push(CurrentSurahRoute(number: surah.number, name: surah.name));},
                  ),
                );
              },
            ),
             bottomNavigationBar: const BottomNavBar(),
    );
  }
}