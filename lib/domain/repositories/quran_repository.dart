import '../models/surah.dart';
import '../models/ayah.dart';

abstract class QuranRepository {
  Future<List<Surah>> fetchSurahList();
  Future<List<Ayah>> fetchAyahList(int surahNumber);
}
