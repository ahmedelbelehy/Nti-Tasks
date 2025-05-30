import 'dart:io';

void main() {
  print("Enter your name of the product");
  String name = stdin.readLineSync()!;

  print("Enter the price of the product");
  double price = double.parse(stdin.readLineSync()!);

  print("Enter the quantity of the product");
  int quantity = int.parse(stdin.readLineSync()!);

  print("is there any product in store ?");
  bool store = bool.parse(stdin.readLineSync()!);

  print("year of manufacture");
  String year = stdin.readLineSync()!;

  print('name of the product is $name');
  print('price of the product is $price');
  print('quantity of the product is $quantity');
  print('is there any product in store $store');
  print('year of manufacture $year');
}
