import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:movies_app/core/utils/app_strings.dart';
import 'package:movies_app/movies/presentation/screens/movie_details_screen.dart';
import 'package:movies_app/movies/presentation/screens/movies_screen.dart';

import 'bindings.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey.shade900,
      ),
      getPages: [
        GetPage(
          name: '/',
          page: () => const MoviesScreen(),
          binding: MoviesBinding(),
        ),
        GetPage(
          name: '/details',
          page: () => const MovieDetailsScreen(),
          binding: MovieDetailsBinding(),
        ),
      ],
    );
  }
}
