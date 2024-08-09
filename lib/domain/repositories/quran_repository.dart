import '../models/surah.dart';

abstract class QuranRepository {
  Future<List<Surah>> fetchSurahList();
  Future<List<Ayah>> fetchAyahList(int surahNumber);
}
