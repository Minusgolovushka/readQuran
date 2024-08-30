import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:readquran/domain/app_router.gr.dart';
import 'package:readquran/domain/models/surah.dart';
import 'package:readquran/domain/providers/surah_list_notifier.dart';

@RoutePage()
class HomeScreen extends ConsumerStatefulWidget {  
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(surahListNitifierProvider.notifier).fetchSurahs();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {  
  final surahs = ref.watch(surahListNitifierProvider);

  return Scaffold(
    appBar: AppBar(
      title: const Text('Quran App'),
      actions: [
        IconButton(
          onPressed: () async {ref.read(surahListNitifierProvider.notifier).fetchSurahs();},
          icon: const Icon(Icons.refresh) 
        ),
        IconButton(
          onPressed: () {context.router.push(const SettingsRoute());}, 
          icon: const Icon(Icons.settings)),
      ],
    ),
    body: Center(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: surahs.length,
          itemBuilder: (context, index) {
            Surah surah = surahs[index];
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
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                title: Text(
                  surah.name,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  surah.englishName,
                  style: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                ),
                trailing: Text(
                  surah.revelationType,
                  style: const TextStyle(fontSize: 12),
                ),
                onTap: () {
                    context.pushRoute(
                    CurrentSurahRoute(number: surah.number, name: surah.name),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

