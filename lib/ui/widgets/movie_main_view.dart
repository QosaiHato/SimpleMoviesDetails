import 'package:cmovies/services/api/tmdb_service.dart';
import 'package:cmovies/ui/viewmodels/movies_cubit.dart';
import 'package:cmovies/ui/viewmodels/movies_state.dart';
import 'package:cmovies/ui/widgets/movie_card_List_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainView extends StatelessWidget {
  const MainView({
    super.key,
    required this.moviesCate,

  });
  final String moviesCate;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoviesCubit(TMDbService())..fetchMovies(moviesCate),
      child: BlocBuilder<MoviesCubit, MoviesState>(
        builder: (context, state) {
          if (state is MoviesLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is MoviesLoaded) {
            double screenWidth = MediaQuery.of(context).size.width;

            return MovieCardListView(
              movies: state.movies,
            );
          } else if (state is MoviesError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return Center(child: Text('No Data'));
        },
      ),
    );
  }
}
