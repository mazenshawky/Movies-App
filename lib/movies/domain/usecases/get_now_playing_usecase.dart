import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/repostiory/base_movies_repository.dart';

class GetNowPlayingMoviesUseCase {
  final BaseMoviesRepository baseMoviesRepository;

  GetNowPlayingMoviesUseCase(this.baseMoviesRepository);

  Future<List<Movie>> execute() async {
    return await baseMoviesRepository.getNowPlaying();
  }
}
