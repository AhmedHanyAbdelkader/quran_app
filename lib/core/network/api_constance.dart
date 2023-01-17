class ApiConstance{

  static const String baseUrl = "http://api.alquran.cloud/v1";
  static String surahPath(int surahNumber) => "$baseUrl/surah/$surahNumber/ar.alafasy";
}