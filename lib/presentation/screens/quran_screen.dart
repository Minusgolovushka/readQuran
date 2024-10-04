import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:readquran/domain/app_router.gr.dart';
import 'package:readquran/domain/models/surah.dart';
import 'package:readquran/domain/providers/surah_list_notifier.dart';
import 'package:readquran/presentation/widgets/bottom_nav_bar.dart';

@RoutePage()
class QuranScreen extends ConsumerStatefulWidget {
  const QuranScreen({super.key});

  @override
  QuranScreenState createState() => QuranScreenState();
}

class QuranScreenState extends ConsumerState<QuranScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(surahListNotifierProvider.notifier).fetchSurahs();
  }

  @override
  Widget build(BuildContext context) {
    final surahState = ref.watch(surahListNotifierProvider);
    final surahListNotifier = ref.read(surahListNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Коран'),
        actions: [
          IconButton(
            onPressed: () {
              context.router.push(const HomeRoute());
            },
            icon: const Icon(Icons.home_outlined),
          ),
          IconButton(
            onPressed: () async {
              surahListNotifier.fetchSurahs();
            },
            icon: const Icon(Icons.refresh),
          ),
          IconButton(
            onPressed: () {
              context.router.push(const SettingsRoute());
            },
            icon: const Icon(Icons.settings_outlined),
          ),
        ],
      ),
      body: Center(
        child: ListView.builder(
          itemCount: surahState.surahs.length,
          itemBuilder: (context, index) {
            Surah surah = surahState.surahs[index];
            bool isLearned = surahListNotifier.isLearned(surah.number);
            bool isInProgress = surahListNotifier.isInProgress(surah.number);

            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                leading: Text(
                  surah.number.toString(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                title: Text(
                  surah.name,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                subtitle: Text(
                  surah.englishName,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                trailing: SizedBox(
                  width: 100,
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(isLearned ? Icons.bookmark : Icons.bookmark_add_outlined),
                        onPressed: () {
                          surahListNotifier.toggleLearnedSurah(surah.number);
                        },
                      ),
                      IconButton(
                        icon: Icon(isInProgress ? Icons.timelapse : Icons.timer_outlined),
                        onPressed: () {
                          surahListNotifier.toggleInProgressSurah(surah.number);
                        },
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  context.pushRoute(
                      CurrentSurahRoute(number: surah.number, name: surah.name));
                },
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
