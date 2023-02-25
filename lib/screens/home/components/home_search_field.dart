import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:tooolbox/screens/onboarding/onboarding_screen.dart';
import 'package:tooolbox/screens/search/home_search_delegate.dart';
import 'package:tooolbox/utils/extensions.dart';

class HomeSearchField extends StatelessWidget {
  const HomeSearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 400),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          leading: const Icon(Icons.search, color: Colors.grey),
          title: const Text(
            "Search...",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          trailing: IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      height: 400,
                      width: 250,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                padding: const EdgeInsets.all(12),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.close),
                              ),
                              const Spacer(flex: 5),
                              Text(
                                'Toolbox',
                                style: context.txtTheme.headlineSmall,
                              ),
                              const Spacer(flex: 9),
                            ],
                          ),
                          const Divider(
                            color: Colors.white,
                            indent: 8,
                            endIndent: 8,
                          ),
                          Expanded(
                            child: ListView(
                              children: [
                                ListTile(
                                  leading: const Icon(Icons.flag_outlined),
                                  title: const Text('Go to onboarding'),
                                  onTap: () {
                                    context.beamToNamed(
                                        OnboardingScreen.routeName);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            icon: const Icon(Icons.settings, color: Colors.grey),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onTap: () {
            showSearch(context: context, delegate: HomeSearchDelegate());
          },
        ),
      ),
    );
  }
}
