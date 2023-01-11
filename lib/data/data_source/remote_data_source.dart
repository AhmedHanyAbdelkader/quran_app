import 'package:dio/dio.dart';
import 'package:quran_app/data/models/surah_model.dart';


class QuranRemoteDataource {
  Dio dio = Dio();

  Future<Surah> getSurah(int surahNumber) async {
    final response = await dio.get('http://api.alquran.cloud/v1/surah/$surahNumber/ar.alafasy');
    Surah result = Surah.fromJson(response.data as Map<String,dynamic>);
    print(result.data?.name);
    if(response.statusCode == 200)
    {
     // print(response.data);
      return result;

    }else
    {
      print(response.statusCode);
      return result;
    }
  }
}
