import 'package:dartz/dartz.dart';
import 'package:quran_app/core/error/failure.dart';
import 'package:quran_app/listening_module/domain/entities/surah.dart';
import 'package:quran_app/listening_module/domain/useCase/get_surah_use_case.dart';

abstract class BaseSurahListeningRepository{
  Future<Either<Failure, Surah>> getSurah(SurahParameters parameters);
}