import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String imageUrl;
  final String desc;
  final double price;
  bool isFavorite;

  Product(
      {required this.id,
      required this.title,
      required this.imageUrl,
      required this.desc,
      required this.price,
      this.isFavorite = false,
     });

  void toogleIsFavorite(){
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
