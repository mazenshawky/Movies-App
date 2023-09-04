import 'dart:async';

import 'package:get/get.dart';

import '../../../core/network/resource_states.dart';
import '../../data/repository/movies_repository.dart';
import '../../domain/usecases/get_movie_details_usecase.dart';
import '../../domain/usecases/get_recommendation_usecase.dart';

class MovieDetailsController extends GetxController {
  final MoviesRepository _repo = Get.find();

  Rx<StateResource> movieDetailsState = StateResource.init().obs;
  Rx<StateResource> recommendationState = StateResource.init().obs;

  late final int _movieId;

  bool _isInitialized = false;
  get isInitialized => _isInitialized;

  void init(int movieId) {
    _movieId = movieId;
    _getMovieDetails();
    _getRecommendation();
    _isInitialized = true;
  }

  FutureOr<void> _getMovieDetails() async {
    movieDetailsState.value = StateResource.loading();

    final result = await _repo.getMovieDetails(MovieDetailsParameters(
      movieId: _movieId,
    ));

    result.fold(
      (l) => movieDetailsState.value = StateResource.error(l.message),
      (r) => movieDetailsState.value = StateResource.success(r),
    );
  }

  FutureOr<void> _getRecommendation() async {
    recommendationState.value = StateResource.loading();

    final result = await _repo.getRecommendation(RecommendaitonParameters(
      movieId: _movieId,
    ));

    result.fold(
      (l) => recommendationState.value = StateResource.error(l.message),
      (r) => recommendationState.value = StateResource.success(r),
    );
  }
}
