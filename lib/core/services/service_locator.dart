import 'package:get_it/get_it.dart';
import 'package:quran_app/listening_module/data/data_source/surah_listening_remote_data_source.dart';
import 'package:quran_app/listening_module/data/repository/get_surah_listening_repository.dart';
import 'package:quran_app/listening_module/domain/repository/base_surah_listening_repository.dart';
import 'package:quran_app/listening_module/domain/useCase/get_surah_use_case.dart';
import 'package:quran_app/listening_module/presentation/controllers/bloc/surah_listening_bloc.dart';

final sl = GetIt.instance;

class ServiceLocator{
  void init(){
    ///Data source
    sl.registerLazySingleton<BaseSurahListeningRemoteDataSource>(() => SurahListeningRemoteDataSource());

    ///Repository
    sl.registerLazySingleton<BaseSurahListeningRepository>(() => GetSurahListeningRepository(sl()));

    ///use case
    sl.registerLazySingleton(() => GetSurahUseCase(sl()));

    /// Surah Bloc
    sl.registerFactory(() => SurahBloc(sl()));
  }
}