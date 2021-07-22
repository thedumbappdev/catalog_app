import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/models/cart.dart';
import 'package:catalog_app/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item itemCatalog;

  AddToCart(
    Item catalog, {
    Key? key,
    required this.itemCatalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    bool isInCart = _cart.items.contains(itemCatalog);

    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          AddMutation(itemCatalog);
        }
      },
      child: isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          StadiumBorder(),
        ),
      ),
    );
  }
}
