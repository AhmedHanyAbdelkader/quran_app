import 'package:quran_app/data/models/surah_model.dart';

enum RequestState {
  loading,
  loaded,
}

class QuranState {
  final Surah surah;
  final RequestState getSurahRequestState;

  const QuranState({
    this.surah = const Surah(),
    this.getSurahRequestState = RequestState.loading
  });

}