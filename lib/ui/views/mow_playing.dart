import 'package:cmovies/services/api/tmdb_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cmovies/ui/widgets/movie_card.dart';
import 'package:cmovies/ui/viewmodels/movies_cubit.dart';
import 'package:cmovies/ui/viewmodels/movies_state.dart';

class NowPlayingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Now Playing Movies'),
      ),
      body: BlocProvider(
        create: (context) => MoviesCubit(TMDbService())..fetchMovies('now_playing'),
        child: BlocBuilder<MoviesCubit, MoviesState>(
          builder: (context, state) {
            if (state is MoviesLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is MoviesLoaded) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2/3.5,
                ),
                itemCount: state.movies.length,
                itemBuilder: (context, index) {
                  return MovieCard(movie: state.movies[index]);
                },
              );
            } else if (state is MoviesError) {
              return Center(child: Text(state.message));
            }
            return Center(child: Text('No movies available'));
          },
        ),
      ),
    );
  }
}
