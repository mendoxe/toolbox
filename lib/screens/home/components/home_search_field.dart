import 'package:flutter/material.dart';
import 'package:tooolbox/screens/search/home_search_delegate.dart';

class HomeSearchField extends StatelessWidget {
  const HomeSearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
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
          onPressed: () {},
          icon: const Icon(Icons.settings, color: Colors.grey),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onTap: () {
          showSearch(context: context, delegate: HomeSearchDelegate());
        },
      ),
    );
  }
}
