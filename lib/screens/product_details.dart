import 'dart:ui';

import 'package:catalog_app/models/catalog.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  final Item catalog;

  const ProductDetails({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffebebd3),
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        buttonPadding: EdgeInsets.all(16.0),
        children: [
          Text(
            "\$ ${catalog.price}",
            style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w300,
                color: Colors.red[900]),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0,),
              child: Text(
                "Buy",
              ),
            ),
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                StadiumBorder(),
              ),
            ),
          ),
        ],
      ),
      appBar: AppBar(),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            ClipPath(
              clipper: CustomClipping(),
              child: Container(
                padding: EdgeInsets.only(
                  bottom: 60.0,
                ),
                decoration: BoxDecoration(
                  color: Color(0xfffbfff1),
                ),
                child: Hero(
                  tag: Key(
                    catalog.id.toString(),
                  ),
                  child: Center(
                    child: Image.network(
                      catalog.image,
                      height: 225.0,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    Text(
                      catalog.name,
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      catalog.desc,
                      style: TextStyle(fontSize: 14.0, color: Colors.black45),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomClipping extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height);
    var startpoints = Offset(size.width * 0.0, size.height - 80.0);
    var startcontrolpoints = Offset(size.width * 0.0, size.height);
    path.quadraticBezierTo(
      startcontrolpoints.dx,
      startcontrolpoints.dy,
      startpoints.dx,
      startpoints.dy,
    );
    var endpoints = Offset(size.width, size.height - 80.0);
    var endcontrolpoints = Offset(size.width * 0.5, size.height);
    path.quadraticBezierTo(
      endcontrolpoints.dx,
      endcontrolpoints.dy,
      endpoints.dx,
      endpoints.dy,
    );
    path.lineTo(size.width, 0.0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
