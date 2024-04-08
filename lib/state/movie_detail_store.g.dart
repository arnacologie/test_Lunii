// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MovieDetailStore on MovieDetailStoreBase, Store {
  Computed<StoreState>? _$stateComputed;

  @override
  StoreState get state =>
      (_$stateComputed ??= Computed<StoreState>(() => super.state,
              name: 'MovieDetailStoreBase.state'))
          .value;

  late final _$_movieDetailFutureAtom =
      Atom(name: 'MovieDetailStoreBase._movieDetailFuture', context: context);

  @override
  ObservableFuture<Result<MovieDetail, Exception>>? get _movieDetailFuture {
    _$_movieDetailFutureAtom.reportRead();
    return super._movieDetailFuture;
  }

  @override
  set _movieDetailFuture(
      ObservableFuture<Result<MovieDetail, Exception>>? value) {
    _$_movieDetailFutureAtom.reportWrite(value, super._movieDetailFuture, () {
      super._movieDetailFuture = value;
    });
  }

  late final _$movieDetailAtom =
      Atom(name: 'MovieDetailStoreBase.movieDetail', context: context);

  @override
  MovieDetail? get movieDetail {
    _$movieDetailAtom.reportRead();
    return super.movieDetail;
  }

  @override
  set movieDetail(MovieDetail? value) {
    _$movieDetailAtom.reportWrite(value, super.movieDetail, () {
      super.movieDetail = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: 'MovieDetailStoreBase.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$getMovieDetailAsyncAction =
      AsyncAction('MovieDetailStoreBase.getMovieDetail', context: context);

  @override
  Future<MovieDetail?> getMovieDetail(String imdbID) {
    return _$getMovieDetailAsyncAction.run(() => super.getMovieDetail(imdbID));
  }

  @override
  String toString() {
    return '''
movieDetail: ${movieDetail},
errorMessage: ${errorMessage},
state: ${state}
    ''';
  }
}
