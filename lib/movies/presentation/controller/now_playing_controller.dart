import 'package:get/get.dart';
import 'package:movies_app/movies/data/repository/movies_repository.dart';

import '../../../core/network/resource_states.dart';

class NowPlayingController extends GetxController {
  final MoviesRepository _repo = Get.find();

  StateResource nowPlayingState = StateResource.init();

  @override
  void onInit() {
    super.onInit();
    getNowPlaying();
  }

  Future<void> getNowPlaying() async {
    nowPlayingState = StateResource.loading();
    
    final result = await _repo.getNowPlayingMovies();

    result.fold(
      (l) => nowPlayingState = StateResource.error(l.message),
      (r) => nowPlayingState = StateResource.success(r),
    );
    update();
  }
}
