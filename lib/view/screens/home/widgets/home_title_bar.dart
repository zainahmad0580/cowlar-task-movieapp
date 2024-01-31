import 'package:flutter/material.dart';
import 'package:movieapp/utils/styles.dart';

class HomeTitleBar extends StatelessWidget {
  const HomeTitleBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Watch', style: ThemeText.appBarText),
        Icon(Icons.search)
      ],
    );
  }
}
