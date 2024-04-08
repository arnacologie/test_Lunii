import 'package:flutter/material.dart';
import 'package:test_lunii/data/movie_repository.dart';
import 'package:test_lunii/state/movie_store.dart';

import 'package:provider/provider.dart';

import 'presentation/home_screen.dart';
import 'state/movie_detail_store.dart';

void main() {
  runApp(const TestLuniiApp());
}

class TestLuniiApp extends StatelessWidget {
  const TestLuniiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => MovieStore(MovieRepositoryiImpl())),
        Provider(create: (context) => MovieDetailStore(MovieRepositoryiImpl())),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const SearchScreen()),
    );
  }
}
