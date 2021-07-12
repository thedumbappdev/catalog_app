import 'package:flutter/material.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "Catalog App",
        style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w600,
            color: Colors.deepPurple),
      ),
      subtitle: Text("Trending Products"),
    );
  }
}