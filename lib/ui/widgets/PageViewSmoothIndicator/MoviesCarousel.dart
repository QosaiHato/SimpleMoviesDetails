import 'package:cmovies/data/models/movie.dart';
import 'package:cmovies/services/api/tmdb_service.dart';
import 'package:cmovies/ui/viewmodels/movies_cubit.dart';
import 'package:cmovies/ui/viewmodels/movies_state.dart';
import 'package:cmovies/ui/widgets/PageViewSmoothIndicator/page_smooth_indicator_view.dart';
import 'package:cmovies/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MoviesCarousel extends StatelessWidget {

  String moviesCate;
  final PageController _pageController = PageController();

  MoviesCarousel({ required this.moviesCate});

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

            return PageSmoothIndicator(
                pageController: _pageController, movies: state.movies);
          } else if (state is MoviesError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return Center(child: Text('No Data'));
        },
      ),
    );
  }
}
