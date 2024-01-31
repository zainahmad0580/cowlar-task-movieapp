import 'package:flutter/material.dart';
import 'package:movieapp/view/screens/home/widgets/home_title_bar.dart';
import 'package:movieapp/view/widgets/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(child: Column(children: [HomeTitleBar(), SearchField()])),
    ));
  }
}
