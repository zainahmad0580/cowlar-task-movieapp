import 'package:flutter/material.dart';
import 'package:movieapp/provider/search_provider.dart';
import 'package:movieapp/utils/app_colors.dart';
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
            hintText: 'TV shows, movies and more'),
        onChanged: (query) => value.setQuery(query),
      );
    }));
  }
}
