import 'package:flutter/material.dart';
import 'package:latihan_pratek_m10/widgets/movie_button.dart';

class MovieAlert extends StatelessWidget {
  MovieAlert({super.key, required this.onOke});

  void Function() onOke;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Delete Movie"),
      content: const Text("Movie akan dihapus secara permanen"),
      actions: [
        SizedBox(
          height: 32,
          child: Row(
            children: [
              MovieButton(
                label: "Cancel",
                onClick: () {
                  Navigator.of(context).pop();
                },
                bgColor: Colors.grey,
              ),
              const SizedBox(
                width: 32,
              ),
              MovieButton(
                label: "Delete",
                onClick: onOke,
                bgColor: Colors.red,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
