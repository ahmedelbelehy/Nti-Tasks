class Product {
  String name;
  double price;
  int stock;

   
  Product(this.name, this.price, this.stock);
}

void main() {
   
  Product myProduct = Product('laptop', 1200.0, 15);

     
  print('product name : ${myProduct.name}');
  print('product price: \$${myProduct.price}');

  
  if (myProduct.stock < 10) {
    print('product stock is low');
  }
}
