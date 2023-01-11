
abstract class QuranEvent {
  const QuranEvent();
}

class GetSurahEvent extends QuranEvent {
  int surahNumber;
  GetSurahEvent({required this.surahNumber});
}
