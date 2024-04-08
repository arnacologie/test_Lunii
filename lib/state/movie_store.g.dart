// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MovieStore on MovieStoreBase, Store {
  Computed<StoreState>? _$stateComputed;

  @override
  StoreState get state => (_$stateComputed ??=
          Computed<StoreState>(() => super.state, name: 'MovieStoreBase.state'))
      .value;

  late final _$_moviesFutureAtom =
      Atom(name: 'MovieStoreBase._moviesFuture', context: context);

  @override
  ObservableFuture<Result<List<Movie>, Exception>>? get _moviesFuture {
    _$_moviesFutureAtom.reportRead();
    return super._moviesFuture;
  }

  @override
  set _moviesFuture(ObservableFuture<Result<List<Movie>, Exception>>? value) {
    _$_moviesFutureAtom.reportWrite(value, super._moviesFuture, () {
      super._moviesFuture = value;
    });
  }

  late final _$moviesAtom =
      Atom(name: 'MovieStoreBase.movies', context: context);

  @override
  List<Movie>? get movies {
    _$moviesAtom.reportRead();
    return super.movies;
  }

  @override
  set movies(List<Movie>? value) {
    _$moviesAtom.reportWrite(value, super.movies, () {
      super.movies = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: 'MovieStoreBase.errorMessage', context: context);

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

  late final _$getMoviesAsyncAction =
      AsyncAction('MovieStoreBase.getMovies', context: context);

  @override
  Future<List<Movie>?> getMovies(String movieQuery) {
    return _$getMoviesAsyncAction.run(() => super.getMovies(movieQuery));
  }

  @override
  String toString() {
    return '''
movies: ${movies},
errorMessage: ${errorMessage},
state: ${state}
    ''';
  }
}
