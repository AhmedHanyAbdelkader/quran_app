import 'package:dio/dio.dart';

class QuranRemoteDataource {
  void getSurah() async {
    final response =
        await Dio().get('http://api.alquran.cloud/v1/surah/114/ar.alafasy');
    if(response.statusCode == 200){
      print(response.data);
    }else{
      print(response.statusCode);
    }
  }
}
