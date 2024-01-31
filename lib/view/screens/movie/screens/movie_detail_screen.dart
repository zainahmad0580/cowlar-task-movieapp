import 'package:flutter/material.dart';
import 'package:movieapp/api/api_endpoints.dart';
import 'package:movieapp/model/movie_model.dart';
import 'package:movieapp/utils/app_colors.dart';
import 'package:movieapp/utils/styles.dart';
import 'package:movieapp/view/screens/movie/widgets/genres.dart';
import 'package:movieapp/view/screens/movie/widgets/overview.dart';
import 'package:movieapp/view/widgets/custom_app_bar.dart';
import 'package:movieapp/view/widgets/outlined_icon_button.dart';
import 'package:movieapp/view/widgets/round_button.dart';

class MovieDetailScreen extends StatelessWidget {
  final MovieModel movieModel;
  const MovieDetailScreen({super.key, required this.movieModel});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const CustomAppBar(title: 'Watch'),
        body: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.only(bottom: size.height * 0.04),
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(ApiEndpoints.storageUrlw500 +
                            movieModel.backdropPath!),
                        onError: (exception, stackTrace) =>
                            const Icon(Icons.error),
                        fit: BoxFit.cover)),
                child:
                    Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Text('In Theatres ${movieModel.releaseDate}',
                      style: ThemeText.headingText20),
                  SizedBox(height: size.height * 0.02),
                  RoundButton(
                      width: size.width * 0.7,
                      title: 'Get Tickets',
                      onPress: () {}),
                  SizedBox(height: size.height * 0.01),
                  OutlinedIconButton(
                      width: size.width * 0.7,
                      iconData: Icons.play_arrow,
                      title: 'Watch Trailer',
                      onPress: () {})
                ]),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(size.height * 0.04),
                width: double.infinity,
                color: AppColors.bg,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Genres(),
                      const Divider(thickness: 0.5),
                      Overview(overview: movieModel.overview)
                    ]),
              ),
            )
          ],
        ));
  }
}
