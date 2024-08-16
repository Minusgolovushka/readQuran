import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:readquran/data/quran_api_service.dart';

final quranApiServiceProvider = Provider((ref) => QuranApiService(Dio()));