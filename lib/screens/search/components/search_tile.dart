import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tooolbox/model/tool.dart';
import 'package:tooolbox/utils/theme.dart';

class SearchTile extends StatelessWidget {
  const SearchTile({Key? key, required this.tool}) : super(key: key);

  final Tool tool;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Container(
          decoration: BoxDecoration(
            color: LIGHTGREY,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(12),
          child: FaIcon(tool.toolIcon, color: tool.color),
        ),
        title: Text(tool.title),
        onTap: () {
          Navigator.pop(context);
          context.beamToNamed(tool.route);
        },
      ),
    );
  }
}
