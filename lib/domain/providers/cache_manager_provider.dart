import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:readquran/domain/cache_manager.dart';

final cacheManagerProvider = Provider<QuranCacheManager>((ref) {
  return QuranCacheManager();
});