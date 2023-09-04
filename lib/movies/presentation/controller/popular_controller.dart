import 'package:get/get.dart';
import 'package:movies_app/movies/data/repository/movies_repository.dart';

import '../../../core/network/resource_states.dart';

class PopularController extends GetxController {
  final MoviesRepository _repo = Get.find();

  StateResource popularState = StateResource.init();

  @override
  void onInit() {
    super.onInit();
    getPopular();
  }

  Future<void> getPopular() async {
    popularState = StateResource.loading();
    
    final result = await _repo.getPopularMovies();

    result.fold(
      (l) => popularState = StateResource.error(l.message),
      (r) => popularState = StateResource.success(r),
    );
    update();
  }
}
