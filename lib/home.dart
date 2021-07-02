import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Catalog App", textAlign: TextAlign.center,)),
      ),
      body: Container(
        child: Center(child: Text("Welcome to Catalog App")),
      ),
      drawer: Drawer(),
    );
  }
}
