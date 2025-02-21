class Products {
  int? id;
  String title;
  String? description;
  double? price;
  String thumbnail;
  String category;

  Products(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.thumbnail,
      required this.category});

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        price: json['price'],
        thumbnail: json['thumbnail'],
        category: json['category']);
  }
}
