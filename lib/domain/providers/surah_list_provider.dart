import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:readquran/data/providers/quran_api_provider.dart';
import 'package:readquran/domain/models/surah.dart';

final surahListProvider = FutureProvider<List<Surah>>((ref) async {
  final apiService = ref.watch(quranApiServiceProvider);
  return apiService.fetchSurahList();
});