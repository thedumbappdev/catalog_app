import 'package:catalog_app/models/catalog.dart';

class CartModel{
  late CatalogModel _catalog;

  // Collection of Ids - store Ids of each Item
  final List<int> _itemIds = [];

  // Get Catalog
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel cartCatalog){
    assert(cartCatalog != null);
    _catalog = cartCatalog;
  }

  // Get items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  // Get total price
  num get totalPrice => items.fold(0, (total, current) => total + current.price);

  // Add items
  void addItem(Item item){
    _itemIds.add(item.id);
  }

  //Remove items
  void removeItem(Item item){
    _itemIds.remove(item.id);
  }
}