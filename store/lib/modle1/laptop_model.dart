class LaptopModel {
  final String id;
  final String name;
  final String brand;
  final num price;
  final String image;
  final String description;
  final String status;
  final String category;
  final int? countInStock;

  LaptopModel({
    required this.id,
    required this.name,
    required this.brand,
    required this.price,
    required this.image,
    required this.description,
    required this.status,
    required this.category,
    required this.countInStock,
  });

  factory LaptopModel.fromJson(Map<String, dynamic> json) {
    return LaptopModel(
      id: json['_id'],
      name: json['name'],
      brand: json['brand'] ?? json['company'],
      price: json['price'],
      image: json['image'],
      description: json['description'] ?? '',
      status: json['status'] ?? '',
      category: json['category'] ?? '',
      countInStock: json['countInStock'],
    );
  }
}
