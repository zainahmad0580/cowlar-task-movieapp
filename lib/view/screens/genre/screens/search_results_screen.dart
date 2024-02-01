import 'package:flutter/material.dart';
import 'package:movieapp/provider/navbar_provider.dart';
import 'package:movieapp/provider/search_provider.dart';
import 'package:movieapp/utils/app_colors.dart';
import 'package:movieapp/view/screens/dashboard/dashboard_screen.dart';
import 'package:movieapp/view/screens/genre/widgets/searched_movies.dart';
import 'package:movieapp/view/screens/media_library/media_library_screen.dart';
import 'package:movieapp/view/screens/more/more_screen.dart';
import 'package:movieapp/view/widgets/custom_app_bar.dart';
import 'package:movieapp/view/widgets/custom_navbar.dart';
import 'package:provider/provider.dart';

class SearchResultsScreen extends StatelessWidget {
  final int resultCount;
  const SearchResultsScreen({super.key, required this.resultCount});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return PopScope(
      onPopInvoked: (didPop) {
        if (didPop) {
          // Clear the query and searched movies when pressing the back button
          Provider.of<SearchProvider>(context, listen: false).clearQuery();
          return;
        }
      },
      child: Scaffold(
        appBar: CustomAppBar(
            title: '$resultCount Results Found',
            isForegroundWhite: false,
            onBackButtonPressed: () =>
                Provider.of<SearchProvider>(context, listen: false)
                    .clearQuery()),
        bottomNavigationBar: const CustomNavBar(),
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
            child: Consumer<NavBarProvider>(builder: (context, navbar, child) {
              return IndexedStack(index: navbar.index, children: [
                const DashboardScreen(),
                Column(children: [
                  Expanded(
                      child: Container(
                          color: AppColors.lightGreyBg,
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.04,
                              vertical: size.height * 0.03),
                          child: const SearchedMovies(showListOnly: true)))
                ]),
                const MediaLibraryScreen(),
                const MoreScreen()
              ]);
            }),
          ),
        ),
      ),
    );
  }
}
