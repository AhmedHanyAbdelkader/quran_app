import 'package:equatable/equatable.dart';

class Ayah extends Equatable{
  final String text;
  final String audio;
  final int numberInSurah;
  final int juz;
  final int hizbQuarter;

  const Ayah({
    required this.text,
    required this.audio,
    required this.numberInSurah,
    required this.juz,
    required this.hizbQuarter,
});

  @override
  List<Object?> get props => [
    text,
    audio,
    numberInSurah,
    juz,
    hizbQuarter,
  ];



}