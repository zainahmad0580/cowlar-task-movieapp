import 'package:flutter/material.dart';

import '../../../../utils/styles.dart';

class Overview extends StatelessWidget {
  final String? overview;
  const Overview({super.key, required this.overview});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Overview', style: ThemeText.boldText),
        SizedBox(height: size.height * 0.01),
        Text(overview ?? '', style: ThemeText.subtitleTextGrey)
      ],
    );
  }
}
