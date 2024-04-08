import 'package:mobx/mobx.dart';

import '../data/movie_repository.dart';
import '../data/result.dart';
import '../domain/movie.dart';

part 'movie_store.g.dart';

class MovieStore = MovieStoreBase with _$MovieStore;

enum StoreState { initial, loading, loaded }

abstract class MovieStoreBase with Store {
  final MovieRepository _movieRepository;

  MovieStoreBase(this._movieRepository);

  @observable
  ObservableFuture<Result<List<Movie>, Exception>>? _moviesFuture;
  @observable
  List<Movie>? movies;

  @observable
  String? errorMessage;

  @computed
  StoreState get state {
    if (_moviesFuture == null ||
        _moviesFuture?.status == FutureStatus.rejected) {
      return StoreState.initial;
    }
    return _moviesFuture?.status == FutureStatus.pending
        ? StoreState.loading
        : StoreState.loaded;
  }

  @action
  Future<List<Movie>?> getMovies(String movieQuery) async {
    errorMessage = null;
    _moviesFuture = ObservableFuture(_movieRepository.fetchMovies(movieQuery.trim()));
    final result = await _moviesFuture;

    return movies = switch (result) {
      Success(value: final movies) => movies,
      Failure() => null,
      null => null,
    };
  }
}
