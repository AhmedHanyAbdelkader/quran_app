import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/data/data_source/remote_data_source.dart';
import 'package:quran_app/presentation/controllers/bloc/quran_events.dart';
import 'package:quran_app/presentation/controllers/bloc/quran_state.dart';

class QuranBloc extends Bloc<QuranEvent, QuranState> {
  QuranRemoteDataource quranRemoteDataource = QuranRemoteDataource();

  QuranBloc(this.quranRemoteDataource) : super(const QuranState()) {
    on<GetSurahEvent>(_getSurah);
  }

  FutureOr<void> _getSurah(
      GetSurahEvent event, Emitter<QuranState> emit) async {
    final result = await quranRemoteDataource.getSurah(event.surahNumber);
    print(result.data?.ayahs.first.text.toString());
    emit(
        QuranState(
      getSurahRequestState: RequestState.loaded,
      surah: result,
    ));
  }
}
