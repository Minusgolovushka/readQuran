import 'package:readquran/domain/models/surah.dart';
import 'package:readquran/domain/models/ayah.dart';

abstract class QuranRepository {
  Future<List<Surah>> fetchSurahList();
  Future<List<Ayah>> fetchAyahList(int surahNumber);
}
