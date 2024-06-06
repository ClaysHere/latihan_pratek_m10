import 'package:flutter/material.dart';
import 'package:latihan_pratek_m10/models/movie_model.dart';
import 'package:latihan_pratek_m10/providers/movies_provider.dart';
import 'package:latihan_pratek_m10/widgets/movie_alert.dart';
import 'package:latihan_pratek_m10/widgets/movie_button.dart';
import 'package:latihan_pratek_m10/widgets/movie_add_form.dart';
import 'package:latihan_pratek_m10/widgets/movie_edit_form.dart';
import 'package:provider/provider.dart';

class MovieItem extends StatelessWidget {
  MovieItem({super.key, required this.movie});

  MovieModel movie;
  void showUpdateMovie(BuildContext ctx, MovieModel movie) {
    showDialog(
      context: ctx,
      builder: (context) => MovieEditForm(
        movie: movie,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.only(bottom: 16),
        elevation: 2,
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 280,
              child: Image.network(
                movie.cover,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                movie.title,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                movie.desc,
                maxLines: 3,
                style: const TextStyle(fontSize: 12, color: Colors.black54),
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MovieButton(
                    label: "DELETE",
                    bgColor: Colors.red,
                    onClick: () {
                      showDialog(
                        context: context,
                        builder: (context) => MovieAlert(
                          onOke: () {
                            context.read<MoviesProvider>().deletemovie(movie);
                            Navigator.of(context).pop();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: const Text("Movie berhasil dihapus"),
                              action: SnackBarAction(
                                  label: "Urungkan",
                                  onPressed: context
                                      .read<MoviesProvider>()
                                      .undoDeleteMovie),
                            ));
                          },
                        ),
                      );
                    },
                  ),
                  MovieButton(
                    label: "EDIT",
                    onClick: () {
                      showUpdateMovie(context, movie);
                    },
                  )
                ],
              ),
            )
          ],
        ));
  }
}
