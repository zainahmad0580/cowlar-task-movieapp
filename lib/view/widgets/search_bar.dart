import 'package:flutter/material.dart';
import 'package:movieapp/provider/search_provider.dart';
import 'package:movieapp/utils/app_colors.dart';
import 'package:provider/provider.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<SearchProvider>(builder: ((context, value, child) {
      return TextField(
        controller: _searchController,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(15),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            suffixIcon: value.query == ''
                ? Icon(
                    Icons.search,
                    color: AppColors.black,
                    size: size.width * 0.1,
                  )
                : IconButton(
                    onPressed: () {
                      _searchController.clear();
                      value.clearQuery();
                    },
                    icon: Icon(
                      Icons.clear,
                      color: AppColors.black,
                      size: size.width * 0.1,
                    )),
            hintText: 'TV shows, movies and more'),
        onChanged: (query) => value.setQuery(query),
      );
    }));
  }
}
