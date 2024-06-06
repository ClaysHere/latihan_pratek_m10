import 'package:flutter/material.dart';

class MovieInput extends StatelessWidget {
  MovieInput(
      {super.key,
      this.maxLines = 1,
      required this.placeHolder,
      required this.controller});

  int maxLines;
  String placeHolder;
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return maxLines == 1
        ? SizedBox(
            height: 36,
            child: TextField(
              controller: controller,
              style: const TextStyle(fontSize: 12),
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 0.0),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                hintText: placeHolder,
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 0.0),
                ),
              ),
            ),
          )
        : TextField(
            controller: controller,
            maxLines: maxLines,
            style: const TextStyle(fontSize: 12),
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
              hintText: placeHolder,
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 0.0),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 0.0),
              ),
            ),
          );
  }
}
