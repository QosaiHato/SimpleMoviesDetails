import 'package:bloc/bloc.dart';
import 'package:cmovies/data/models/movie.dart';
import 'package:cmovies/services/api/tmdb_service.dart';
import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final TMDbService tmdbService;

  SearchCubit(this.tmdbService) : super(SearchInitial());

  void searchMovies(String query) async {
    if (query.isEmpty) {
      emit(SearchEmpty());
      return;
    }
    try {
      emit(SearchLoading());
      final response = await tmdbService.searchMovies(query);
      final movies = (response.data['results'] as List)
          .map((movie) => Movie.fromJson(movie))
          .toList();
      emit(SearchLoaded(movies));
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }
}
