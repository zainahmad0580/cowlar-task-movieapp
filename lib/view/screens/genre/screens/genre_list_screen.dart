import 'package:flutter/material.dart';
import 'package:movieapp/api/genre_api.dart';
import 'package:movieapp/model/genre_model.dart';
import 'package:movieapp/utils/app_colors.dart';
import 'package:movieapp/view/screens/genre/widgets/genre_card.dart';
import 'package:movieapp/view/widgets/search_field.dart';

class GenreListScreen extends StatelessWidget {
  const GenreListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
          child: Column(children: [
            const SearchField(),
            SizedBox(height: size.height * 0.03),
            Container(
              color: AppColors.lightGreyBg,
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.04, vertical: size.height * 0.03),
              child: FutureBuilder(
                  future: GenreApi.getAllGenres(context),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return const Icon(Icons.error);
                    } else {
                      List<GenreModel> genres = snapshot.data ?? [];

                      if (genres.isEmpty) {
                        return const Text('No genre found');
                      }

                      return GridView.builder(
                          itemCount: genres.length,
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: size.width * 0.03,
                                  mainAxisSpacing: size.height * 0.02,
                                  childAspectRatio:
                                      size.width / size.width * 1.5),
                          itemBuilder: ((context, index) {
                            final genre = genres[index];
                            return GenreCard(genreModel: genre);
                          }));
                    }
                  }),
            )
          ]),
        ),
      )),
    );
  }
}
