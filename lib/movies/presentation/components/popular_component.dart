import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/movies/presentation/controller/popular_controller.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/network/api_constance.dart';
import '../../domain/entities/movie.dart';

class PopularComponent extends StatelessWidget {
  const PopularComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PopularController>(
      builder: (controller) {
        if (controller.popularState.isLoading()) {
          return const SizedBox(
              height: 170,
              child: Center(
                child: CircularProgressIndicator(),
              ));
        } else if (controller.popularState.isSuccess()) {
          final movies = controller.popularState.data as List<Movie>;
          return FadeIn(
            duration: const Duration(milliseconds: 500),
            child: SizedBox(
              height: 170.0,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  return Container(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: InkWell(
                      onTap: () {
                        /// TODO : NAVIGATE TO  MOVIE DETAILS
                      },
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8.0)),
                        child: CachedNetworkImage(
                          width: 120.0,
                          fit: BoxFit.cover,
                          imageUrl: ApiConstance.imageUrl(movie.backdropPath!),
                          placeholder: (context, url) => Shimmer.fromColors(
                            baseColor: Colors.grey[850]!,
                            highlightColor:
                                const Color.fromARGB(255, 66, 66, 66),
                            child: Container(
                              height: 170.0,
                              width: 120.0,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        } else if (controller.popularState.isError()) {
          return const SizedBox(
              height: 170,
              child: Center(
                child: CircularProgressIndicator(),
              ));
        } else {
          return Container();
        }
      },
    );
  }
}
