import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movies_event.dart';
import 'package:movies_app/movies/presentation/controller/movies_state.dart';

import '../../../core/services/services_locater.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return MoviesBloc(sl())..add(GetNowPlayingEvent());
      },
      child: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context, state) {
          print(state);
          return const Scaffold();
        },
      ),
    );
  }
}
