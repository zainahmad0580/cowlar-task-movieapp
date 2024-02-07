import 'package:flutter/material.dart';
import 'package:movieapp/api/api_endpoints.dart';
import 'package:movieapp/api/movie_api.dart';
import 'package:movieapp/model/movie_details_model.dart';
import 'package:movieapp/model/movie_model.dart';
import 'package:movieapp/provider/video_provider.dart';
import 'package:movieapp/routes/route_names.dart';
import 'package:movieapp/utils/app_colors.dart';
import 'package:movieapp/utils/styles.dart';
import 'package:movieapp/utils/utils.dart';
import 'package:movieapp/view/screens/movie/widgets/genres.dart';
import 'package:movieapp/view/screens/movie/widgets/overview.dart';
import 'package:movieapp/view/widgets/custom_app_bar.dart';
import 'package:movieapp/view/widgets/outlined_icon_button.dart';
import 'package:movieapp/view/widgets/round_button.dart';
import 'package:provider/provider.dart';

class MovieDetailScreen extends StatelessWidget {
  final MovieModel movieModel;
  const MovieDetailScreen({super.key, required this.movieModel});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    int? movieId = movieModel.id;
    //Set trailer of the movie as the widget is builtt, for quick access
    if (movieId != null) {
      Provider.of<VideoProvider>(context, listen: false).getTrailer(movieId);
    }
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const CustomAppBar(
          title: 'Watch',
        ),
        body: movieId == null
            ? const Center(child: Text('No Data Found'))
            : FutureBuilder(
                future: MovieApi.getMovieDetails(movieId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(child: Icon(Icons.error));
                  } else {
                    MovieDetailsModel? movieDetailsModel = snapshot.data;

                    return Column(
                      children: [
                        Container(
                          alignment: Alignment.bottomCenter,
                          height: size.height * 0.5,
                          padding: EdgeInsets.only(bottom: size.height * 0.04),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: AppColors.black,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      ApiEndpoints.storageUrlw500 +
                                          movieModel.backdropPath!),
                                  onError: (exception, stackTrace) =>
                                      const Icon(Icons.error),
                                  fit: BoxFit.cover)),
                          child: SingleChildScrollView(
                            child: Column(children: [
                              Text('In Theatres ${movieModel.releaseDate}',
                                  style: ThemeText.headingText20),
                              SizedBox(height: size.height * 0.02),
                              RoundButton(
                                  width: size.width * 0.7,
                                  title: 'Get Tickets',
                                  onPress: () {}),
                              SizedBox(height: size.height * 0.01),
                              Consumer<VideoProvider>(
                                  builder: (context, value, child) {
                                return OutlinedIconButton(
                                    width: size.width * 0.7,
                                    iconData: Icons.play_arrow,
                                    title: 'Watch Trailer',
                                    onPress: () async {
                                      if (value.videoKey == null) {
                                        Utils.showLoader(context);
                                        await value.getTrailer(movieId);
                                        Utils.hideLoader(context);
                                        if (value.videoKey != null) {
                                          Navigator.pushNamed(
                                              context, RouteNames.video,
                                              arguments: value.videoKey);
                                        }
                                      } else {
                                        Navigator.pushNamed(
                                            context, RouteNames.video,
                                            arguments: value.videoKey);
                                      }
                                    });
                              })
                            ]),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(size.height * 0.04),
                            width: double.infinity,
                            color: AppColors.white,
                            child: SingleChildScrollView(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (movieDetailsModel != null)
                                      Genres(genres: movieDetailsModel.genres!),
                                    SizedBox(height: size.height * 0.01),
                                    const Divider(thickness: 0.5),
                                    SizedBox(height: size.height * 0.01),
                                    Overview(overview: movieModel.overview)
                                  ]),
                            ),
                          ),
                        )
                      ],
                    );
                  }
                }));
  }
}
