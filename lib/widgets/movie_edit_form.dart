import 'package:flutter/material.dart';
import 'package:latihan_pratek_m10/models/movie_model.dart';
import 'package:latihan_pratek_m10/providers/movies_provider.dart';
import 'package:latihan_pratek_m10/widgets/movie_button.dart';
import 'package:latihan_pratek_m10/widgets/movie_input.dart';
import 'package:provider/provider.dart';

class MovieEditForm extends StatelessWidget {
  MovieEditForm({super.key, required this.movie});

  MovieModel movie;

  final TextEditingController _titleC = TextEditingController();
  final TextEditingController _coverC = TextEditingController();
  final TextEditingController _descC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _titleC.text = movie.title;
    _coverC.text = movie.cover;
    _descC.text = movie.desc;
    return AlertDialog(
      titlePadding: const EdgeInsets.only(top: 12),
      title: const Text(
        "Edit Movie",
        style: TextStyle(fontSize: 18),
        textAlign: TextAlign.center,
      ),
      content: SizedBox(
        height: 200,
        child: SingleChildScrollView(
          child: Column(
            children: [
              MovieInput(
                placeHolder: "Judul",
                controller: _titleC,
              ),
              const SizedBox(
                height: 16,
              ),
              MovieInput(
                placeHolder: "Gambar",
                controller: _coverC,
              ),
              const SizedBox(
                height: 16,
              ),
              MovieInput(
                controller: _descC,
                placeHolder: "Deskripsi",
                maxLines: 5,
              )
            ],
          ),
        ),
      ),
      actions: [
        SizedBox(
          height: 28,
          child: Row(
            children: [
              MovieButton(
                label: "Batal",
                bgColor: Colors.red,
                onClick: () {
                  Navigator.of(context).pop();
                },
              ),
              const SizedBox(
                width: 16,
              ),
              MovieButton(
                label: "Oke",
                onClick: () {
                  context.read<MoviesProvider>().updateMovie(MovieModel(
                      title: _titleC.text,
                      cover: _coverC.text,
                      desc: _descC.text,
                      id: movie.id));
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: const Text("Movie berhasil di edit"),
                    action: SnackBarAction(
                        label: "Urungkan",
                        onPressed:
                            context.read<MoviesProvider>().undoDeleteMovie),
                  ));
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
