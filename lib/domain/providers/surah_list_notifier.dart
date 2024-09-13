import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:readquran/data/providers/quran_api_provider.dart';
import 'package:readquran/domain/models/surah.dart';


class SurahListState {
  final List<Surah> surahs;
  final List<int> learnedSurahs;
  final List<int> inProgressSurahs;

  SurahListState({
    required this.surahs,
    required this.learnedSurahs,
    required this.inProgressSurahs,
  });

  // Начальное состояние
  factory SurahListState.initial() {
    return SurahListState(
      surahs: [],
      learnedSurahs: [],
      inProgressSurahs: [],
    );
  }

  // Метод для копирования состояния с новыми значениями
  SurahListState copyWith({
    List<Surah>? surahs,
    List<int>? learnedSurahs,
    List<int>? inProgressSurahs,
  }) {
    return SurahListState(
      surahs: surahs ?? this.surahs,
      learnedSurahs: learnedSurahs ?? this.learnedSurahs,
      inProgressSurahs: inProgressSurahs ?? this.inProgressSurahs,
    );
  }
}

class SurahListNotifier extends Notifier<SurahListState> {
  late Box surahBox;

  @override
  SurahListState build() {
    // Инициализация и загрузка данных из локального хранилища Hive
    surahBox = Hive.box('processBox');
    return SurahListState.initial().copyWith(
      learnedSurahs: List<int>.from(surahBox.get('learnedSurahs', defaultValue: [])),
      inProgressSurahs: List<int>.from(surahBox.get('inProgressSurahs', defaultValue: [])),
    );
  }

  Future<void> fetchSurahs() async {
    final apiService = ref.read(quranApiServiceProvider);
    try {
      final surahs = await apiService.fetchSurahList();
      // Обновляем состояние с полученными сурами
      state = state.copyWith(surahs: surahs);
    } catch (error) {
      state = state.copyWith(surahs: []);
      rethrow;
    }
  }

  // Добавление суры в список "Изученные"
  void toggleLearnedSurah(int surahNumber) {
    final updatedLearnedSurahs = List<int>.from(state.learnedSurahs);
    if (updatedLearnedSurahs.contains(surahNumber)) {
      updatedLearnedSurahs.remove(surahNumber);
    } else {
      updatedLearnedSurahs.add(surahNumber);
    }
    state = state.copyWith(learnedSurahs: updatedLearnedSurahs);
    _saveLearnedSurahs(updatedLearnedSurahs);
  }

  // Добавление/удаление суры в список "В процессе"
  void toggleInProgressSurah(int surahNumber) {
    final updatedInProgressSurahs = List<int>.from(state.inProgressSurahs);
    if (updatedInProgressSurahs.contains(surahNumber)) {
      updatedInProgressSurahs.remove(surahNumber);
    } else {
      updatedInProgressSurahs.add(surahNumber);
    }
    state = state.copyWith(inProgressSurahs: updatedInProgressSurahs);
    _saveInProgressSurahs(updatedInProgressSurahs);
  }

  // Сохранение списка "Изученных" сур в Hive
  void _saveLearnedSurahs(List<int> learnedSurahs) {
    surahBox.put('learnedSurahs', learnedSurahs);
  }

  // Сохранение списка "В процессе" сур в Hive
  void _saveInProgressSurahs(List<int> inProgressSurahs) {
    surahBox.put('inProgressSurahs', inProgressSurahs);
  }

  // Проверка, находится ли сура в списке "Изученные"
  bool isLearned(int surahNumber) {
    return state.learnedSurahs.contains(surahNumber);
  }

  // Проверка, находится ли сура в списке "В процессе"
  bool isInProgress(int surahNumber) {
    return state.inProgressSurahs.contains(surahNumber);
  }
}

final surahListNotifierProvider = NotifierProvider<SurahListNotifier, SurahListState>(SurahListNotifier.new);
