import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:quran_app/core/error/failure.dart';
import 'package:quran_app/core/use_case/base_use_case.dart';
import 'package:quran_app/listening_module/domain/entities/surah.dart';
import 'package:quran_app/listening_module/domain/repository/base_surah_listening_repository.dart';

class GetSurahUseCase extends BaseListeningUseCase <Surah,SurahParameters>
{
  BaseSurahListeningRepository baseSurahListeningRepository;

  GetSurahUseCase(this.baseSurahListeningRepository);

  @override
  Future<Either<Failure, Surah>> call(SurahParameters parameters) async{
    return await baseSurahListeningRepository.getSurah(parameters);
  }



}




class SurahParameters extends Equatable{
  final int surahNumber;

  const SurahParameters(this.surahNumber);

  @override
  List<Object?> get props => [
    surahNumber
  ];

}