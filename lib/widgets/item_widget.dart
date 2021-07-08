import 'package:catalog_app/models/catalog.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: (){
          print("${item.name} clicked!");
        },
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text(
          "\u{20B9} ${item.price}",
          textScaleFactor: 1.25,
          style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
