import 'package:get/get.dart';
import 'package:movies_app/movies/data/repository/movies_repository.dart';

import '../../../core/network/resource_states.dart';

class TopRatedController extends GetxController {
  final MoviesRepository _repo = Get.find();

  Rx<StateResource> topRatedState = StateResource.init().obs;

  @override
  void onInit() {
    super.onInit();
    getTopRated();
  }

  Future<void> getTopRated() async {
    topRatedState.value = StateResource.loading();

    final result = await _repo.getTopRatedMovies();

    result.fold(
      (l) => topRatedState.value = StateResource.error(l.message),
      (r) => topRatedState.value = StateResource.success(r),
    );
  }
}
