import 'package:equatable/equatable.dart';
import 'package:quran_app/listening_module/domain/entities/ayah.dart';
import 'package:quran_app/listening_module/domain/entities/edition.dart';

class SurahData extends Equatable{
  final String name;
  final List<Ayah> ayahs;
  final Edition edition;

  const SurahData({
    required this.name,
    required this.ayahs,
    required this.edition,
});

  @override
  List<Object> get props => [
    name,
    ayahs,
    edition,
  ];
}