import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:readquran/domain/app_router.gr.dart';
import 'package:readquran/domain/providers/ayah_list_notifier.dart';
import 'package:readquran/presentation/providers/current_surah_screen_state_provider.dart';
import 'package:readquran/presentation/widgets/audio_bottom_bar.dart';

@RoutePage()
class CurrentSurahScreen extends ConsumerStatefulWidget {
  final int number;
  final String name;

  const CurrentSurahScreen({super.key, required this.number, required this.name});

  @override
  CurrentSurahScreenState createState() => CurrentSurahScreenState();
}

class CurrentSurahScreenState extends ConsumerState<CurrentSurahScreen> {
  late ScrollController scontroller;

  @override
  void initState() {
    super.initState();
    scontroller = ScrollController();
    ref.read(ayahListNotifierProvider.notifier).fetchAyahs(widget.number);
  }

  @override
  void dispose() {
    scontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ayahs = ref.watch(ayahListNotifierProvider);
    debugPrint(Theme.of(context).textTheme.bodyLarge?.fontFamily);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        actions: [
          IconButton(
            onPressed: () async {
            ref.read(ayahListNotifierProvider.notifier).fetchAyahs(widget.number);
            },
            icon: const Icon(Icons.refresh),
          ),
          IconButton(
            onPressed: () {
              context.router.push(const SettingsRoute());
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Center(
        child: ListView.builder(
          controller: scontroller,
          itemCount: ayahs.length,
          itemBuilder: (context, index) {
            final ayah = ayahs[index];
            final currentAyahIndex = ref.watch(currentAyahIndexProvider);
            return Card(
              color: index == currentAyahIndex ? Theme.of(context).colorScheme.secondary : Theme.of(context).cardColor,
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
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                subtitle: Text(
                  ayah.translation,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                onTap: () async {
                  ref.read(currentAyahIndexProvider.notifier).state = index;
                },
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: const AudioBottomBar(),
    );
  }
}

