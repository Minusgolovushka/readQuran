import 'package:flutter_cache_manager/file.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class QuranCacheManager {
  static final _cacheManager = CacheManager(
    Config(
      'quran', 
      maxNrOfCacheObjects: 100, 
      stalePeriod: const Duration(days: 7)),
  );

  Future<File> downloadFile(String url) async {
    return await _cacheManager.getSingleFile(url);
  }
}