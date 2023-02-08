import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tooolbox/model/tool.dart';

class HomeGridTile extends StatelessWidget {
  const HomeGridTile({Key? key, required this.tool}) : super(key: key);

  final Tool tool;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: InkWell(
            onTap: () => context.beamToNamed(tool.route),
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: FaIcon(tool.toolIcon, color: tool.color, size: 30),
            ),
          ),
        ),
        Hero(
          tag: tool.title,
          flightShuttleBuilder: (_, __, ___, ____, _____) => Text(
            tool.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          child: Text(
            tool.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
