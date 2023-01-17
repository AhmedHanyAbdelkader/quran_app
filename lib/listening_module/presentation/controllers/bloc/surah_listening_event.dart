import 'package:equatable/equatable.dart';

abstract class SurahEvent extends Equatable{
  const SurahEvent();

  @override
  List<Object> get props => [];
}

class GetSurahEvent extends SurahEvent{
  final int surahNumber;
  GetSurahEvent(this.surahNumber);
}