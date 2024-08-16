import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentAyahIndexProvider = StateProvider<int>((ref) => 0);
final isPlayingProvider = StateProvider<bool>((ref) => false);