import 'dart:ui';

import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/utils/routes.dart';
import 'package:catalog_app/widgets/home_widgets/add_to_cart.dart';
import 'package:flutter/cupertino.dart';
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
          AddToCart(catalog, itemCatalog: catalog,),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Color(0xfffbfff1),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 0.0,
              horizontal: 8.0,
            ),
            child: IconButton(
              icon: Icon(CupertinoIcons.cart),
              onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
            ),
          ),
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            ClipPath(
              clipper: CustomClipping(),
              child: Container(
                padding: EdgeInsets.only(
                  bottom: 30.0,
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
                      height: 200.0,
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
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16.0),
                        child: Text(
                          "When the self of conclusion grasps the surrenders of the lord, the silence will know spirit. Who can understand the trust and beauty of a lord if he has the evil emptiness of the sinner?",
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12.0,
                          ),
                        ),
                      ),
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
    var startpoints = Offset(size.width * 0.0, size.height - 50.0);
    var startcontrolpoints = Offset(size.width * 0.0, size.height);
    path.quadraticBezierTo(
      startcontrolpoints.dx,
      startcontrolpoints.dy,
      startpoints.dx,
      startpoints.dy,
    );
    var endpoints = Offset(size.width, size.height - 50.0);
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
