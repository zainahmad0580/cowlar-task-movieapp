import 'package:flutter/material.dart';
import 'package:movieapp/provider/navbar_provider.dart';
import 'package:movieapp/view/screens/dashboard/dashboard_screen.dart';
import 'package:movieapp/view/screens/home/widgets/home_app_bar.dart';
import 'package:movieapp/view/screens/media_library/media_library_screen.dart';
import 'package:movieapp/view/screens/more/more_screen.dart';
import 'package:movieapp/view/screens/movie/screens/movie_list_screen.dart';
import 'package:movieapp/view/widgets/custom_navbar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        bottomNavigationBar: const CustomNavBar(),
        appBar: const HomeAppBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.03, vertical: size.height * 0.03),
          child: Consumer<NavBarProvider>(builder: (context, value, child) {
            return IndexedStack(index: value.index, children: const [
              DashboardScreen(),
              MovieListScreen(),
              MediaLibraryScreen(),
              MoreScreen()
            ]);
          }),
        ));
  }
}
