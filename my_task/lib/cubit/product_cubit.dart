

import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<List<Map<String, String>>> {
  ProductCubit() : super(_products);

  static const List<Map<String, String>> _products = [
    {
      'title': 'Smartphone',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQonniNGE2DZLt7ykEtyJn5B2fzzv-Kz5kG_w&s',
      'description': 'A powerful smartphone with 128GB storage and great camera.',
      'price': '15,000',
    },
    {
      'title': 'Laptop',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHLpGBIMT6_HCT6r5ycvOqTGL3-ZpFdxwIGg&s',
      'description': 'A fast laptop suitable for work and gaming.',
      'price': '30,000',
    },
    {
      'title': 'Headphones',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUHev07IU1vNS527rWOLJfCmB1E625r-VL0w&s',
      'description': 'Noise-cancelling wireless headphones.',
      'price': '600',
    },
    {
      'title': 'Smartwatch',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSO3KMCbT7OMHU7GlQzahfBKtmLfVCWAu8zrQ&s',
      'description': 'Stylish smartwatch with health tracking features.',
      'price': '1,500',
    },
    {
      'title': 'hard ssd',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKQVzEZmaqdPU2iowG8pHkurYvv6Xgum3WeA&s',
      'description': 'hard ssd 512 faster.',
      'price': '2,000',
    },
    {
      'title': 'Camera',
      'image': 'https://graphicdesigneye.com/images/Nikon-Z7-II.jpg',
      'description': 'nikon camera .',
      'price': '40,000',
    },
  ];
}
