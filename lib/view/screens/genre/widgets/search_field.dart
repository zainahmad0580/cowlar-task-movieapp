import 'package:flutter/material.dart';
import 'package:movieapp/provider/search_provider.dart';
import 'package:movieapp/routes/route_names.dart';
import 'package:movieapp/utils/app_colors.dart';
import 'package:movieapp/utils/styles.dart';
import 'package:provider/provider.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
      child: Consumer<SearchProvider>(builder: ((context, value, child) {
        return TextField(
          controller: _searchController,
          decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.lightGreyBg,
              contentPadding: const EdgeInsets.all(15),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(40.0)),
              prefixIcon: Icon(
                Icons.search,
                color: AppColors.black,
                size: size.width * 0.075,
              ),
              suffixIcon: value.query == ''
                  ? Icon(
                      Icons.clear,
                      color: AppColors.black,
                      size: size.width * 0.075,
                    )
                  : IconButton(
                      onPressed: () {
                        _searchController.clear();
                        value.clearQuery();
                      },
                      icon: Icon(
                        Icons.clear,
                        color: AppColors.black,
                        size: size.width * 0.075,
                      )),
              hintStyle: ThemeText.subtitleTextGrey,
              hintText: 'TV shows, movies and more'),
          onChanged: (query) async => await value.setQuery(query),
          onEditingComplete: () {
            if (value.query.isNotEmpty) {
              //Remove current route from the stack so that we go back to home if back pressed from results screen
              Navigator.pushNamedAndRemoveUntil(
                context,
                RouteNames.searchResult,
                (route) => route.isFirst,
                arguments: value.searchedMovies.length,
              );
            }
          },
        );
      })),
    );
  }
}
