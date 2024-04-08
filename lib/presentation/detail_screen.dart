import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:test_lunii/domain/movie_detail.dart';

import '../state/movie_detail_store.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.imdbID});
  final String imdbID;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  MovieDetailStore? _movieDetailStore;
  MovieDetail? _movieDetail;

  @override
  void didChangeDependencies() {
    _movieDetailStore ??= Provider.of<MovieDetailStore>(context);
    _movieDetailStore?.getMovieDetail(widget.imdbID);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Observer(
            builder: (_) {
              switch (_movieDetailStore?.state) {
                case StoreState.initial || null:
                  return const SizedBox.shrink();
                case StoreState.loading:
                  return buildLoading();
                case StoreState.loaded:
                  _movieDetail = _movieDetailStore?.movieDetail;
                  return buildColumnWithData(_movieDetailStore?.movieDetail);
              }
            },
          ),
        ),
      ),
    );
  }

  Widget buildLoading() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget buildColumnWithData(MovieDetail? movieDetail) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1 / 1,
            child: CachedNetworkImage(
              imageUrl: movieDetail?.imageURL ?? '',
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          const SizedBox(height: 15),
          Text(movieDetail?.title ?? '',
              textAlign: TextAlign.center,
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text(
            '${movieDetail?.year ?? ''} - ${movieDetail?.country ?? ''}',
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: 300,
            child: FilledButton.icon(
              style:
                  FilledButton.styleFrom(backgroundColor: Colors.orangeAccent),
              onPressed: () {},
              icon: const Icon(
                Icons.watch_later,
                color: Colors.black,
              ),
              label: const Text(
                'Regarder plus tard',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: double.infinity,
            child: Card(
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Durée"),
                    Text(
                      movieDetail?.duration ?? '',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 15),
                    const Text("Résumé"),
                    Text(
                      movieDetail?.plot ?? '',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 15),
                    const Text("Réalisateur"),
                    Text(
                      movieDetail?.director ?? '',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 15),
                    const Text("Acteurs"),
                    Text(
                      movieDetail?.actors ?? '',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
