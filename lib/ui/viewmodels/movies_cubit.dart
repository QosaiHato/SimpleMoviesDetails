// lib/ui/viewmodels/movies_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:cmovies/data/models/movie.dart';
import 'package:cmovies/services/api/tmdb_service.dart';
import 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  final TMDbService tmdbService;

  MoviesCubit(this.tmdbService) : super(MoviesInitial());

  void fetchMovies(String type) async {
    try {
      emit(MoviesLoading());
      final response = await tmdbService.getMovies(type);
      final List<Movie> movies = List<Movie>.from(
          (response.data['results'] as List)
              .map((json) => Movie.fromJson(json)));
      emit(MoviesLoaded(movies));
    } catch (e) {
      emit(MoviesError(e.toString()));
    }
  }

  void searchMovies(String query) async {
    if (query.isEmpty) {
      emit(MoviesEmpty());
      return;
    }
    try {
      emit(MoviesLoading());
      final response = await tmdbService.searchMovies(query);
      final movies = (response.data['results'] as List)
          .map((movie) => Movie.fromJson(movie))
          .toList();
      emit(MoviesLoaded(movies));
    } catch (e) {
      emit(MoviesError(e.toString()));
    }
  }

 
}
