import 'package:flutter/material.dart';

class MovieButton extends StatelessWidget {
  MovieButton(
      {super.key,
      required this.label,
      this.bgColor = Colors.blue,
      required this.onClick});

  String label;
  Color bgColor;
  void Function() onClick;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onClick,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(0)),
          textStyle:
              const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
        child: Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
