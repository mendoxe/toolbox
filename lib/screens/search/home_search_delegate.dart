import 'package:flutter/material.dart';
import 'package:tooolbox/model/tool.dart';
import 'package:tooolbox/screens/search/components/search_tile.dart';
import 'package:tooolbox/tools.dart';
import 'package:tooolbox/utils/theme.dart';

class HomeSearchDelegate extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      appBarTheme: const AppBarTheme(
        backgroundColor: LIGHTGREY,
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear),
        ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return const BackButton();
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: ListView(
        children: tools
            .where((Tool tool) =>
                tool.title.toLowerCase().contains(query.toLowerCase()))
            .map((Tool tool) => SearchTile(tool: tool))
            .toList(),
      ),
    );
  }
}
