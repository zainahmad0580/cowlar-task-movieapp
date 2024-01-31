import 'package:flutter/material.dart';
import 'package:movieapp/utils/app_colors.dart';
import 'package:movieapp/view/widgets/search_field.dart';

class GenreListScreen extends StatelessWidget {
  const GenreListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
        child: Column(children: [
          const SearchField(),
        ]),
      )),
    );
  }
}
