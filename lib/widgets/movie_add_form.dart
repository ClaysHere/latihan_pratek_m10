import 'package:flutter/material.dart';
import 'package:latihan_pratek_m10/models/movie_model.dart';
import 'package:latihan_pratek_m10/providers/movies_provider.dart';
import 'package:latihan_pratek_m10/widgets/movie_button.dart';
import 'package:latihan_pratek_m10/widgets/movie_input.dart';
import 'package:provider/provider.dart';

class MovieAddForm extends StatelessWidget {
  MovieAddForm({super.key});

  final TextEditingController _titleC = TextEditingController();
  final TextEditingController _coverC = TextEditingController();
  final TextEditingController _descC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: const EdgeInsets.only(top: 12),
      title: const Text(
        "Tambah Movie",
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
                  context.read<MoviesProvider>().addMovie(MovieModel(
                      title: _titleC.text,
                      cover: _coverC.text,
                      desc: _descC.text,
                      id: context.read<MoviesProvider>().movies.length + 1));

                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
