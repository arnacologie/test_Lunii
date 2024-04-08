import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/movie_store.dart';
import 'search_delegate.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  MovieStore? _movieStore;

  @override
  void didChangeDependencies() {
    _movieStore ??= Provider.of<MovieStore>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Rechercher un film...'),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: CustomSeachDelegate(_movieStore));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: const Center(
        child: Text('Page d\'acceuil', style: TextStyle(fontSize: 30),),
      ),
    );
  }
}
