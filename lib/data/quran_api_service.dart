import 'package:dio/dio.dart';
import 'package:readquran/domain/models/surah.dart';
import 'package:readquran/domain/models/ayah.dart';
import 'package:readquran/domain/repositories/quran_repository.dart';

class QuranApiService implements QuranRepository {
  final String _baseUrl = "https://api.alquran.cloud/v1/";

  final Dio _dio;

  QuranApiService(this._dio);

  @override
  Future<List<Surah>> fetchSurahList() async {
    final response = await _dio.get('${_baseUrl}surah');
    return (response.data['data'] as List).map((json) => Surah.fromJson(json)).toList();
  }

  @override
  Future<List<Ayah>> fetchAyahList(int surahNumber) async {
    final responseArabic = await _dio.get('${_baseUrl}surah/$surahNumber');
    final responseRussian = await _dio.get('${_baseUrl}surah/$surahNumber/ru.kuliev');
    final responseAudio = await _dio.get('${_baseUrl}surah/$surahNumber/ar.alafasy');

    List<Ayah> arabicAyahs = (responseArabic.data['data']['ayahs'] as List).map((json) => Ayah.fromJson(json)).toList();
    List<Ayah> russianAyahs = (responseRussian.data['data']['ayahs'] as List).map((json) => Ayah.fromJson(json)).toList();
    List<Ayah> audioAyahs = (responseAudio.data['data']['ayahs'] as List).map((json) => Ayah.fromJson(json)).toList();

    for (int i = 0; i < arabicAyahs.length; i++) {
      arabicAyahs[i] = Ayah(
        numberInSurah: arabicAyahs[i].numberInSurah,
        text: arabicAyahs[i].text,
        translation: russianAyahs[i].text,
        audio: audioAyahs[i].audio,
      );
    }

    return arabicAyahs;
  }
}
