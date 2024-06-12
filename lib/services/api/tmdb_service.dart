import 'package:dio/dio.dart';

class TMDbService {
  final String apiKey = '8d203ecd6be8136ed05e0fe6c0d30ca0';
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://api.themoviedb.org/3/'));

  Future<Response> getMovies(String movieType) async {
    return await _dio.get('movie/$movieType', queryParameters: {'api_key': apiKey});
  }

  Future<Response> searchMovies(String query) async {
    return await _dio.get('search/movie', queryParameters: {'api_key': apiKey, 'query': query});
  }


}
