import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cmovies/ui/viewmodels/movies_cubit.dart';
import 'package:cmovies/ui/viewmodels/movies_state.dart';
import 'package:cmovies/ui/widgets/movie_card_List_view.dart';
import 'package:cmovies/ui/widgets/movie_main_view.dart';
import 'package:cmovies/utils/app_text_styles.dart';
import 'package:cmovies/services/api/tmdb_service.dart';
import 'package:cmovies/ui/viewmodels/movies_cubit.dart';
import 'package:cmovies/ui/viewmodels/movies_state.dart';
import 'package:cmovies/ui/widgets/PageViewSmoothIndicator/MoviesCarousel.dart';
import 'package:cmovies/utils/app_colors.dart';

class MoviesPage extends StatelessWidget {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          MoviesCarousel(moviesCate: "upcoming"),
          TitleText("Popular"),
          MainView(
            moviesCate: "top_rated",
          ),
          TitleText("Top Rated"),
          MainView(
            moviesCate: "popular",
          ),
          // blocBuilderMovies('top_rated', (movies) => MovieCardListView(movies: movies)),
          // TitleText("Popular"),
          // blocBuilderMovies('popular', (movies) => MovieCardListView(movies: movies)),
        ],
      ),
    );
  }

  Column TitleText(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Text(
            title,
            style: AppTextStyles.titleTextStyle,
          ),
        ),
      ],
    );
  }
}

  // Widget buildBody(String type, BuildContext context) {
  //   return BlocBuilder<MoviesCubit, MoviesState>(
  //     builder: (context, state) {
  //       if (state is MoviesEmpty) {
  //         return Center(child: Text('No movies found.'));
  //       }
  //       if (state is MoviesLoading) {
  //         return Center(child: CircularProgressIndicator());
  //       } else if (state is MoviesLoaded) {
  //         if (state.movies.isEmpty) {
  //           return Center(child: Text('No movies found.'));
  //         }
  //         return ListView.builder(
  //           itemCount: state.movies.length,
  //           itemBuilder: (context, index) {
  //             final movie = state.movies[index];
  //             return Padding(
  //               padding: const EdgeInsets.all(8.0),
  //               child: Container(
  //                 decoration: BoxDecoration(
  //                   borderRadius: BorderRadius.circular(10.0),
  //                   border: Border.all(color: primaryColor, width: 2),
  //                 ),
  //                 child: Row(
  //                   children: [
  //                     ClipRRect(
  //                       borderRadius: BorderRadius.circular(8.0),
  //                       child: Image.network(
  //                         'https://image.tmdb.org/t/p/w185${movie.posterPath}',
  //                         fit: BoxFit.cover,
  //                         width: 100,
  //                         height: 150,
  //                       ),
  //                     ),
  //                     SizedBox(width: 8),
  //                     Expanded(
  //                       child: Column(
  //                         crossAxisAlignment: CrossAxisAlignment.start,
  //                         children: [
  //                           Text(
  //                             movie.title,
  //                             style: TextStyle(
  //                               fontSize: 18,
  //                               fontWeight: FontWeight.bold,
  //                             ),
  //                           ),
  //                           SizedBox(height: 8),
  //                           Text(
  //                             movie.overview,
  //                             maxLines: 3,
  //                             overflow: TextOverflow.ellipsis,
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             );
  //           },
  //         );
  //       } else if (state is MoviesError) {
  //         return Center(child: Text(state.message));
  //       }
  //       return Center(child: Text('Please wait...'));
  //     },
  //   );
  // }

