import 'package:flutter/material.dart';

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        padding: const EdgeInsets.all(
          8.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Color(0xfffbfff1),
        ),
        child: Image.network(
          image,
          fit: BoxFit.cover,
          width: 60.0,
        ),
      ),
    );
  }
}