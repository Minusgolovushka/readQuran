import 'package:flutter_riverpod/flutter_riverpod.dart';

class CurrentAyahIndexNotifier extends StateNotifier<int> {
  CurrentAyahIndexNotifier() : super(0);

  void setAyahIndex(int index) {
    state = index;
  }

  void resetAyahIndex() {
    state = 0;
  }
}

final currentAyahIndexNotifierProvider = StateNotifierProvider<CurrentAyahIndexNotifier, int>((ref) {
  return CurrentAyahIndexNotifier();
});