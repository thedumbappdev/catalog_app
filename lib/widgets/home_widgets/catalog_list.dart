import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/widgets/home_widgets/catalog_image.dart';
import 'package:flutter/material.dart';

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 0.0,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Color(0xffebebd3),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: Key(
                  catalog.id.toString(),
                ),
                child: CatalogImage(
                  image: catalog.image,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 12.0,
                    bottom: 12.0,
                    left: 0.0,
                    right: 12.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        catalog.name,
                        style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        catalog.desc,
                        style: TextStyle(fontSize: 10.0, color: Colors.black45),
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.spaceBetween,
                        buttonPadding: EdgeInsets.zero,
                        children: [
                          Text(
                            "\$ ${catalog.price}",
                            style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.deepPurple),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              "Buy",
                            ),
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                StadiumBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
