import 'package:flutter/material.dart';
import '../../domain/models/surah.dart';
import '../../data/quran_api_service.dart';
import 'current_surah_screen.dart';
import 'package:dio/dio.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final QuranApiService quranApiService = QuranApiService(Dio());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quran App'),
      ),
      body: FutureBuilder(
        future: quranApiService.fetchSurahList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Surah surah = snapshot.data![index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                    leading: 
                      Text(
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
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CurrentSurahScreen(
                          QuranRepository: quranApiService,
                          number: surah.number,
                          name: surah.name,
                        ),
                      ));
                    },
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
