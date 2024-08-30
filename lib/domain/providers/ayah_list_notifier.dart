import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:readquran/data/providers/quran_api_provider.dart';
import 'package:readquran/domain/models/ayah.dart';


class AyahListNotifier extends Notifier<List<Ayah>> {
    @override
    List<Ayah> build() {
      return [];
    }

    Future<void> fetchAyahs(int surahNumber) async {
    final apiServise = ref.read(quranApiServiceProvider);
    try{
      final ayahs = await apiServise.fetchAyahList(surahNumber);
      state = ayahs;
    }catch(error){
      state = [];
      rethrow;
    }
  }
}

final ayahListNotifierProvider = NotifierProvider<AyahListNotifier, List <Ayah>>(() {
  return AyahListNotifier();
});
