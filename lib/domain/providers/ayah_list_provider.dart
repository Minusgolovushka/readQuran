import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:readquran/data/providers/quran_api_provider.dart';
import 'package:readquran/domain/models/ayah.dart';

final ayahListProvider = FutureProvider.family<List<Ayah>, int>((ref, surahNumber) async {
  final apiService = ref.watch(quranApiServiceProvider);
  return apiService.fetchAyahList(surahNumber);
});