import 'package:quran_app/listening_module/data/model/ayah_model.dart';
import 'package:quran_app/listening_module/data/model/edition_model.dart';
import 'package:quran_app/listening_module/domain/entities/surah_data.dart';

class SurahDataModel extends SurahData{
  const SurahDataModel({
    required super.name,
    required super.ayahs,
    required super.edition,
  });

  factory SurahDataModel.fromJson(Map<String,dynamic> json) => SurahDataModel(
  name: json['name'],
  ayahs: List<AyahModel>.from(
    json['ayahs'].map(
            (element)=> AyahModel.fromJson(element)
    )
  ),
  edition: EditionModel.fromJson(json['edition'])
  );

}