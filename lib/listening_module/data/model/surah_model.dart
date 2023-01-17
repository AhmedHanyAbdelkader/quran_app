import 'package:quran_app/listening_module/domain/entities/surah.dart';
import 'package:quran_app/listening_module/data/model/surah_data_model.dart';

class SurahModel extends Surah{
  const SurahModel({
    required super.data
  });

  factory SurahModel.fromJson(Map<String,dynamic> json) => SurahModel(
      data: SurahDataModel.fromJson(json['data'])
  );

}