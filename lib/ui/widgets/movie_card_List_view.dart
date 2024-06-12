import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cmovies/data/models/movie.dart';
import 'package:cmovies/ui/widgets/movie_card.dart';
import 'package:cmovies/ui/viewmodels/movies_cubit.dart';
import 'package:cmovies/ui/viewmodels/movies_state.dart';

class MovieCardListView extends StatelessWidget {
  const MovieCardListView({
    Key? key,
    required this.movies,
  }) : super(key: key);

  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 330,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return MovieCard(movie: movie);
        },
      ),
    );
  }
}