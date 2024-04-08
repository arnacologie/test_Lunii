import 'package:mobx/mobx.dart';

import '../data/movie_repository.dart';
import '../data/result.dart';
import '../domain/movie_detail.dart';

part 'movie_detail_store.g.dart';

class MovieDetailStore = MovieDetailStoreBase with _$MovieDetailStore;

enum StoreState { initial, loading, loaded }

abstract class MovieDetailStoreBase with Store {
  final MovieRepository _movieRepository;

  MovieDetailStoreBase(this._movieRepository);

  @observable
  ObservableFuture<Result<MovieDetail, Exception>>? _movieDetailFuture;
  @observable
  MovieDetail? movieDetail;

  @observable
  String? errorMessage;

  @computed
  StoreState get state {
    if (_movieDetailFuture == null ||
        _movieDetailFuture?.status == FutureStatus.rejected) {
      return StoreState.initial;
    }
    return _movieDetailFuture?.status == FutureStatus.pending
        ? StoreState.loading
        : StoreState.loaded;
  }

  @action
  Future<MovieDetail?> getMovieDetail(String imdbID) async {
    errorMessage = null;
    _movieDetailFuture = ObservableFuture(_movieRepository.fetchMovieDetail(imdbID));
    final result = await _movieDetailFuture;

    return movieDetail = switch (result) {
      Success(value: final movieDetail) => movieDetail,
      Failure() => null,
      null => null,
    };
  }
}
