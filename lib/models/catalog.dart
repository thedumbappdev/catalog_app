class Item {
  final String id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});

  final products = [
    Item(
        id: "prod001",
        name: "iPhone 12 Pro",
        desc: "Apple iPhone 12th generation",
        price: 119900,
        color: "#506875 - Pacific Blue",
        image:
            "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-12-pro-blue-hero?wid=470&hei=556&fmt=png-alpha&.v=1604021661000"),
  ];
}
