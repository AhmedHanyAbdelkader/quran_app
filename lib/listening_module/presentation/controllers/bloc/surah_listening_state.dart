import 'package:equatable/equatable.dart';
import 'package:quran_app/core/utils/enums.dart';
import 'package:quran_app/listening_module/domain/entities/surah.dart';

class SurahState extends Equatable{
  final String getSurahErrorMessage;
  final GetSurahRequestState getSurahRequestState;
  final Surah surah;

  const SurahState({
    this.surah = const Surah(data: null),
    this.getSurahRequestState = GetSurahRequestState.loading,
    this.getSurahErrorMessage = '',
});

  @override
  List<Object?> get props => [
    getSurahErrorMessage,
    getSurahRequestState,
    surah,
  ];
}