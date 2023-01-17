import 'package:dio/dio.dart';
import 'package:quran_app/core/error/exception.dart';
import 'package:quran_app/core/network/api_constance.dart';
import 'package:quran_app/core/network/error_message_model.dart';
import 'package:quran_app/listening_module/data/model/surah_model.dart';
import 'package:quran_app/listening_module/domain/useCase/get_surah_use_case.dart';

abstract class BaseSurahListeningRemoteDataSource{
  Future<SurahModel> getSurah(SurahParameters parameters);
}

class SurahListeningRemoteDataSource extends BaseSurahListeningRemoteDataSource{
  Dio dio = Dio();
  @override
  Future<SurahModel> getSurah(SurahParameters parameters) async{
    final response =  await dio.get(ApiConstance.surahPath(parameters.surahNumber));
    if(response.statusCode == 200){
      return SurahModel.fromJson(response.data);
    }else{
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

}