import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/utils/enums.dart';
import 'package:quran_app/listening_module/domain/useCase/get_surah_use_case.dart';
import 'package:quran_app/listening_module/presentation/controllers/bloc/surah_listening_event.dart';
import 'package:quran_app/listening_module/presentation/controllers/bloc/surah_listening_state.dart';

class SurahBloc extends Bloc<SurahEvent,SurahState>{
  final GetSurahUseCase getSurahUseCase;
  SurahBloc(this.getSurahUseCase) : super(const SurahState())
  {
    on<GetSurahEvent>(_getSurah);
  }


  FutureOr<void> _getSurah(GetSurahEvent event, Emitter<SurahState> emit) async
  {
    final result = await getSurahUseCase(SurahParameters(event.surahNumber));
    result.fold(
          (l) => emit(
              SurahState(
                getSurahErrorMessage: l.message,
                getSurahRequestState: GetSurahRequestState.error
              ),
          ),
          (r) => emit(
            SurahState(
              surah: r,
              getSurahRequestState: GetSurahRequestState.loaded
            ),
          ),
    );
  }
}