import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../domain/movie.dart';
import '../state/movie_store.dart';
import 'detail_screen.dart';

class CustomSeachDelegate extends SearchDelegate {
  final MovieStore? _movieStore;
  List<Movie>? _movies;
  CustomSeachDelegate(this._movieStore);

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
            onPressed: () {
              if (query.isEmpty) {
                close(context, null);
              } else {
                query = '';
              }
            },
            icon: const Icon(Icons.clear))
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back));

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      alignment: Alignment.center,
      child: Observer(
        builder: (_) {
          switch (_movieStore?.state) {
            case StoreState.initial || null:
              return buildInitialInput();
            case StoreState.loading:
              return buildLoading();
            case StoreState.loaded:
              _movies = _movieStore?.movies;
              return buildColumnWithData(_movieStore?.movies ?? []);
          }
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) => ListTile(
        title: Text(query),
        onTap: () {
          searchMovies(query);
          showResults(context);
        },
      );

  Widget buildInitialInput() {
    return const Center(child: Text("initial"));
  }

  Widget buildLoading() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget buildColumnWithData(List<Movie> movies) {
    return Center(
        child: ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DetailScreen(imdbID: movies[index].imdbID)),
                ),
                leading: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: CachedNetworkImage(
                    imageUrl: movies[index].imageURL,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                title: Text(
                  movies[index].title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle:
                    Text('${movies[index].year} | (${movies[index].type})'),
              );
            }));
  }

  void searchMovies(String movieQuery) async {
    await _movieStore?.getMovies(movieQuery);
  }
}

