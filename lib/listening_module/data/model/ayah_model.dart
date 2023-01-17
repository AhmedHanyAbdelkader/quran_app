import 'package:quran_app/listening_module/domain/entities/ayah.dart';

class AyahModel extends Ayah{
  const AyahModel({
    required super.text,
    required super.audio,
    required super.numberInSurah,
    required super.juz,
    required super.hizbQuarter,
  });

  factory AyahModel.fromJson(Map<String,dynamic> json) => AyahModel(
    text: json['text'],
    audio: json['audio'],
    numberInSurah: json['numberInSurah'],
    juz: json['juz'],
    hizbQuarter: json['hizbQuarter'],
  );

}