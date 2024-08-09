class Surah {
  final int number;
  final String name;
  final String englishName;
  final String revelationType;

  Surah({
    required this.number,
    required this.name,
    required this.englishName,
    required this.revelationType,
  });

  factory Surah.fromJson(Map<String, dynamic> json) {
    return Surah(
      number: json['number'],
      name: json['name'],
      englishName: json['englishName'],
      revelationType: json['revelationType'],
    );
  }
}

class Ayah {
  final int numberInSurah;
  final String text;
  final String translation;
  final String audio;

  Ayah({
    required this.numberInSurah,
    required this.text,
    required this.translation,
    required this.audio,
  });

  factory Ayah.fromJson(Map<String, dynamic> json) {
    return Ayah(
      numberInSurah: json['numberInSurah'],
      text: json['text'],
      translation: json['translation'] ?? '',
      audio: json['audio'] ?? '',
    );
  }
}
