import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:quran_app/core/error/failure.dart';

abstract class BaseListeningUseCase<T, Parameters>{
  Future<Either<Failure, T>> call(Parameters parameters);
}

class NoParameters extends Equatable{
  const NoParameters();

  @override
  List<Object?> get props => [];

}