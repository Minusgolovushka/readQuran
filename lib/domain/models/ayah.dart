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
