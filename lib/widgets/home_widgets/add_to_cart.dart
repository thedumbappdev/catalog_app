import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:catalog_app/models/cart.dart';
import 'package:catalog_app/models/catalog.dart';

class AddToCart extends StatelessWidget {
  final Item itemCatalog;

  AddToCart(Item catalog, {Key? key, required this.itemCatalog})
      : super(key: key);

  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(itemCatalog);
    return ElevatedButton(
      onPressed: () {
        if(!isInCart){
          isInCart = !isInCart;
          final _catalog = CatalogModel();

          _cart.catalog = _catalog;
          _cart.addItem(itemCatalog);

          // setState(() {});
        }
      },
      child: isInCart
          ? Icon(Icons.done)
          : Icon(CupertinoIcons.cart),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          StadiumBorder(),
        ),
      ),
    );
  }
}