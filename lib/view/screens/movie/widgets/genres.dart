import 'package:flutter/material.dart';
import 'package:movieapp/utils/styles.dart';

class Genres extends StatelessWidget {
  const Genres({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Text('Genres', style: ThemeText.boldText),
      ],
    );
  }
}
