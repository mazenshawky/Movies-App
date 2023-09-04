import 'package:get/get.dart';
import 'package:movies_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies_app/movies/data/repository/movies_repository.dart';
import 'package:movies_app/movies/domain/repostiory/base_movies_repository.dart';
import 'package:movies_app/movies/presentation/controller/movie_details_controller.dart';
import 'package:movies_app/movies/presentation/controller/now_playing_controller.dart';
import 'package:movies_app/movies/presentation/controller/popular_controller.dart';
import 'package:movies_app/movies/presentation/controller/top_rated_controller.dart';

class MoviesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NowPlayingController>(() => NowPlayingController());
    Get.lazyPut<PopularController>(() => PopularController());
    Get.lazyPut<TopRatedController>(() => TopRatedController());
    Get.lazyPut<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource());
    Get.lazyPut<MovieRemoteDataSource>(() => MovieRemoteDataSource());
    Get.lazyPut<BaseMoviesRepository>(() => MoviesRepository());
    Get.lazyPut<MoviesRepository>(() => MoviesRepository());
  }
}

class MovieDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MovieDetailsController>(() => MovieDetailsController());
    Get.lazyPut<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource());
    Get.lazyPut<BaseMoviesRepository>(() => MoviesRepository());
  }
}
