import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/recommendation.dart';
import 'package:movies_app/movies/domain/repostiory/base_movies_repository.dart';

class GetRecommendationUseCase
    implements BaseUseCase<List<Recommendation>, RecommendaitonParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetRecommendationUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Recommendation>>> call(
      RecommendaitonParameters parameters) async {
    return await baseMoviesRepository.getRecommendation(parameters);
  }
}

class RecommendaitonParameters extends Equatable {
  final int movieId;

  const RecommendaitonParameters({required this.movieId});

  @override
  List<Object?> get props => [movieId];
}
