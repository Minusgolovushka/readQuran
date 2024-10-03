import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:readquran/domain/app_router.gr.dart';
import 'package:readquran/domain/providers/surah_list_notifier.dart';
import 'package:readquran/presentation/widgets/bottom_nav_bar.dart';

@RoutePage()
class InProgressSurahsScreen extends ConsumerWidget {
  const InProgressSurahsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final surahState = ref.watch(surahListNotifierProvider);
    final inProgressSurahs = surahState.inProgressSurahs;
    final surahListNotifier = ref.read(surahListNotifierProvider.notifier);
    return Scaffold(
      appBar: AppBar(title: Text('In Progress Surahs: ${surahState.inProgressSurahs.length}')),
      body: inProgressSurahs.isEmpty
          ? const Center(child: Text('Нет сур в процессе.'))
          : ListView.builder(
              itemCount: inProgressSurahs.length,
              itemBuilder: (context, index) {
                final surah = surahState.surahs.firstWhere(
                  (s) => s.number == inProgressSurahs[index],
                );
                return Card(
                margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                ),
                child:  
                  ListTile(
                  leading: Text(surah.number.toString(), style: Theme.of(context).textTheme.titleMedium,),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_outline),
                    onPressed: () {surahListNotifier.toggleInProgressSurah(surah.number);}
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