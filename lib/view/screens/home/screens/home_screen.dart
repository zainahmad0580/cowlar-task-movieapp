import 'package:flutter/material.dart';
import 'package:movieapp/view/screens/home/widgets/home_title_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [HomeTitleBar(), SearchBar()]),
    ));
  }
}
