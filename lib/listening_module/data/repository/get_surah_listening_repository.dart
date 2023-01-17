import 'package:dartz/dartz.dart';
import 'package:quran_app/core/error/exception.dart';
import 'package:quran_app/core/error/failure.dart';
import 'package:quran_app/listening_module/data/data_source/surah_listening_remote_data_source.dart';
import 'package:quran_app/listening_module/domain/entities/surah.dart';
import 'package:quran_app/listening_module/domain/repository/base_surah_listening_repository.dart';
import 'package:quran_app/listening_module/domain/useCase/get_surah_use_case.dart';

class GetSurahListeningRepository extends BaseSurahListeningRepository{
  BaseSurahListeningRemoteDataSource baseSurahListeningRemoteDataSource;
  GetSurahListeningRepository(this.baseSurahListeningRemoteDataSource);
  @override
  Future<Either<Failure, Surah>> getSurah(SurahParameters parameters) async
  {
    try{
      final result = await baseSurahListeningRemoteDataSource.getSurah(parameters);
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

}