import 'package:dio/dio.dart';

import '../domain/movie.dart';
import '../domain/movie_detail.dart';

import 'result.dart';

abstract class MovieRepository {
  Future<Result<List<Movie>, Exception>> fetchMovies(String movieQuery);
  Future<Result<MovieDetail, Exception>> fetchMovieDetail(String imdbID);
}

class MovieRepositoryiImpl implements MovieRepository {
  final dio = Dio();
  final apiKey = '7e515ef0';

  @override
  Future<Result<List<Movie>, Exception>> fetchMovies(String movieQuery) async {
    try {
      final response = await dio
          .get('https://www.omdbapi.com/?apikey=$apiKey&s=$movieQuery');
      switch (response.statusCode) {
        case 200:
          final List<dynamic> data = response.data["Search"];
          final List<Movie> movies =
              data.map((item) => Movie.fromMap(item)).toList();
          return Success(movies);
        default:
          return Failure(Exception(response.statusMessage));
      }
    } on Exception catch (e) {
      return Failure(e);
    }
  }
  

  @override
  Future<Result<MovieDetail, Exception>> fetchMovieDetail(String imdbID) async {
    try {
      final response = await dio
          .get('https://www.omdbapi.com/?apikey=$apiKey&i=$imdbID');
      switch (response.statusCode) {
        case 200:
          final MovieDetail movieDetail = MovieDetail.fromMap(response.data);
          return Success(movieDetail);
        default:
          return Failure(Exception(response.statusMessage));
      }
    } on Exception catch (e) {
      return Failure(e);
    }
  }
}
