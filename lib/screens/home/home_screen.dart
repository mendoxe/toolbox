import 'package:flutter/material.dart';
import 'package:tooolbox/model/tool.dart';
import 'package:tooolbox/screens/home/components/home_grid_tile.dart';
import 'package:tooolbox/tools.dart';

import 'components/home_search_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = "/";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const HomeSearchField(),
              Expanded(
                child: GridView.extent(
                  padding: const EdgeInsets.all(12.0),
                  maxCrossAxisExtent: 100,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1 / 1.55,
                  children: tools
                      .map((Tool tool) => HomeGridTile(tool: tool))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
