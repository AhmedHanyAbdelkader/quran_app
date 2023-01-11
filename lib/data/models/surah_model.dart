class Surah {
  final SurahData? data;
  const Surah({this.data});
  factory Surah.fromJson(Map<String, dynamic> json) =>
      Surah(
          data: SurahData.fromJson(json['data']), 
      );
}



class SurahData {
  String name;
  List<Ayahs> ayahs;
  Edition edition;
  SurahData({required this.name, required this.ayahs, required this.edition});
  factory SurahData.fromJson(Map<String, dynamic> json) => SurahData(
      name: json['name'],
      ayahs: List<Ayahs>.from(
        json['ayahs'].map(
          (element) => Ayahs.fromJson(element),
        ),
      ),
      edition: Edition.fromJson(json['edition']));
}


class Ayahs {
  String text;
  int numberInSurah;

  Ayahs({required this.text, required this.numberInSurah});

  factory Ayahs.fromJson(Map<String, dynamic> json) =>
      Ayahs(text: json['text'], numberInSurah: json['numberInSurah']);
}

class Edition {
  String name;
  String language;

  Edition({required this.name, required this.language});

  factory Edition.fromJson(Map<String, dynamic> json) => Edition(
        name: json['name'],
        language: json['language'],
      );
}


