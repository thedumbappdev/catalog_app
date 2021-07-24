import 'dart:ui';
import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/models/cart.dart';
import 'package:catalog_app/screens/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffbfff1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Cart"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: _CartList(),
            ),
          ),
          Divider(
            height: 20.0,
          ),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;

    return SizedBox(
      height: 100.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxBuilder(
            mutations: {RemoveMutation},
            builder: (context, MyStore, _){
              assert(MyStore != null);
              return Text(
                "\$${_cart.totalPrice}",
                style: TextStyle(
                  color: Colors.pink,
                  fontSize: 24.0,
                ),
              );
            },
          ),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    "Buying not supported yet.",
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
              shape: MaterialStateProperty.all(
                StadiumBorder(),
              ),
              padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 40.0,
                ),
              ),
            ),
            child: Text(
              "Buy",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;

    if (_cart.items.isEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Your cart is empty",
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            ),
            child: Text("Continue Shopping"),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Colors.deepPurpleAccent),
              shape: MaterialStateProperty.all(StadiumBorder()),
            ),
          ),
        ],
      );
    } else {
      return ListView.builder(
        itemCount: _cart.items.length,
        itemBuilder: (context, index) => ListTile(
          leading: Icon(CupertinoIcons.checkmark_alt),
          trailing: IconButton(
            icon: Icon(CupertinoIcons.minus_circle),
            onPressed: () => RemoveMutation(_cart.items[index]),
          ),
          title: Text(_cart.items[index].name),
        ),
      );
    }
  }
}