import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/screens/product_details.dart';
import 'package:catalog_app/widgets/drawer.dart';
import 'package:catalog_app/widgets/home_widgets/catalog_header.dart';
import 'package:catalog_app/widgets/home_widgets/catalog_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productData = decodedData["products"];
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
    // print(productData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          /*title: Text(
          "Catalog App",
          textAlign: TextAlign.center,
        ),
        centerTitle: true,*/
          ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 0.0,
        ),
        child: Column(
          children: [
            CatalogHeader(),
            if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 0.0,
                  ),
                  child: CatalogList(),
                ),
              )
            else
              Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
          ],
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.items.length,
        itemBuilder: (context, index) {
          final catalog = CatalogModel.items[index];
          return InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetails(catalog: catalog),
              ),
            ),
            child: CatalogItem(catalog: catalog),
          );
        });
  }
}
