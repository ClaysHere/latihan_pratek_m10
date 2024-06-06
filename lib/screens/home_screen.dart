import 'package:flutter/material.dart';

import 'package:latihan_pratek_m10/providers/movies_provider.dart';
import 'package:latihan_pratek_m10/widgets/movie_add_form.dart';
import 'package:latihan_pratek_m10/widgets/movie_item.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void showAddMovie(BuildContext ctx) {
    showDialog(
      context: ctx,
      builder: (context) => MovieAddForm(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies"),
        actions: [
          IconButton(
              onPressed: () {
                showAddMovie(context);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        child: ListView(
          children: [
            ...context.watch<MoviesProvider>().movies.map(
                  (movie) => MovieItem(
                    movie: movie,
                  ),
                )
          ],
        ),
      ),
    );
  }
}
