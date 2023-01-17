import 'package:equatable/equatable.dart';
import 'package:quran_app/listening_module/domain/entities/surah_data.dart';

class Surah extends Equatable{

  final SurahData? data;

  const Surah({
     this.data
});

  @override
  List<Object?> get props => [
    data
  ];
}