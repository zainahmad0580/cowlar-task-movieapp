import 'package:flutter/material.dart';
import 'package:movieapp/provider/genre_provider.dart';
import 'package:movieapp/provider/navbar_provider.dart';
import 'package:movieapp/provider/search_provider.dart';
import 'package:movieapp/utils/app_colors.dart';
import 'package:movieapp/view/screens/dashboard/dashboard_screen.dart';
import 'package:movieapp/view/screens/genre/widgets/genre_card.dart';
import 'package:movieapp/view/screens/genre/widgets/searched_movies.dart';
import 'package:movieapp/view/screens/media_library/media_library_screen.dart';
import 'package:movieapp/view/screens/more/more_screen.dart';
import 'package:movieapp/view/widgets/custom_navbar.dart';
import 'package:movieapp/view/widgets/search_field.dart';
import 'package:provider/provider.dart';

class GenreListScreen extends StatelessWidget {
  const GenreListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: const CustomNavBar(),
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
          child: Consumer<NavBarProvider>(builder: (context, navbar, child) {
            return IndexedStack(index: navbar.index, children: [
              const DashboardScreen(),
              RefreshIndicator(
                onRefresh: () async =>
                    await Provider.of<GenreProvider>(context, listen: false)
                        .setGenres(),
                child: Column(children: [
                  const SearchField(),
                  SizedBox(height: size.height * 0.03),
                  Expanded(
                    child: Container(
                        color: AppColors.lightGreyBg,
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.04,
                            vertical: size.height * 0.03),
                        child: Consumer2<SearchProvider, GenreProvider>(builder:
                            (context, searchProvider, genreProvider, child) {
                          if (searchProvider.query.isEmpty) {
                            if (genreProvider.genres.isEmpty) {
                              return const Text('No genre found');
                            }

                            return GridView.builder(
                                itemCount: genreProvider.genres.length,
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: size.width * 0.03,
                                        mainAxisSpacing: size.height * 0.02,
                                        childAspectRatio:
                                            size.width / size.width * 1.5),
                                itemBuilder: ((context, index) {
                                  final genre = genreProvider.genres[index];
                                  return GenreCard(genreModel: genre);
                                }));
                          } else {
                            return const SearchedMovies();
                          }
                        })),
                  )
                ]),
              ),
              const MediaLibraryScreen(),
              const MoreScreen()
            ]);
          }),
        ),
      ),
    );
  }
}
