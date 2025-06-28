class FavoriteModel {
  final int sales;
  final String id;
  final String status;
  final String category;
  final String name;
  final num price;
  final String description;
  final String image;
  final List<dynamic> images;
  final String company;
  final int countInStock;
  final int v;

  FavoriteModel({
    required this.sales,
    required this.id,
    required this.status,
    required this.category,
    required this.name,
    required this.price,
    required this.description,
    required this.image,
    required this.images,
    required this.company,
    required this.countInStock,
    required this.v,
  });

  factory FavoriteModel.fromJson(Map<String, dynamic> json) {
    return FavoriteModel(
      sales: json['sales'],
      id: json['_id'],
      status: json['status'],
      category: json['category'],
      name: json['name'],
      price: json['price'],
      description: json['description'],
      image: json['image'],
      images: json['images'],
      company: json['company'],
      countInStock: json['countInStock'],
      v: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sales': sales,
      '_id': id,
      'status': status,
      'category': category,
      'name': name,
      'price': price,
      'description': description,
      'image': image,
      'images': images,
      'company': company,
      'countInStock': countInStock,
      '__v': v,
    };
  }
}