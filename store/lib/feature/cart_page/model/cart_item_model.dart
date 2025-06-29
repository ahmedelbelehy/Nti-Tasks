class CartItemModel {
  final String id;
  final String productId;
  final String name;
  final String image;
  final int quantity;
  final double price;

  CartItemModel({
    required this.id,
    required this.productId,
    required this.name,
    required this.image,
    required this.quantity,
    required this.price,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      id: json['_id'] ?? '',
      productId: json['productId'] ?? '',
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      quantity: json['quantity'] is int
          ? json['quantity']
          : int.tryParse(json['quantity'].toString()) ?? 1,
      price: json['price'] is double
          ? json['price']
          : double.tryParse(json['price'].toString()) ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'productId': productId,
      'name': name,
      'image': image,
      'quantity': quantity,
      'price': price,
    };
  }
}
