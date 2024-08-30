import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:readquran/data/providers/quran_api_provider.dart';
import 'package:readquran/domain/models/surah.dart';

class SurahListNotifier extends Notifier<List<Surah>>{
  @override
  List<Surah> build() {
    return [];
  }

  Future<void> fetchSurahs() async {
    final apiService = ref.read(quranApiServiceProvider);
    try{
      final surahs = await apiService.fetchSurahList();
      state = surahs;
    }catch(error){
      state = [];
      rethrow;
    }
  }
}

final surahListNitifierProvider = NotifierProvider<SurahListNotifier, List <Surah>>(() {
  return SurahListNotifier();
});