import 'package:dartz/dartz.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';

import '../error/failure.dart';

abstract class BaseUseCase<T> {
  Future<Either<Failure, T>> call();
}
