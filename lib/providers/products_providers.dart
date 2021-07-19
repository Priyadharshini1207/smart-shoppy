import 'package:flutter/material.dart';
import 'product.dart';

class ProductsProvider with ChangeNotifier {
  List<Product> _products = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      desc: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      desc: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      desc: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      desc: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ];

  // bool _showFavItemsOnly = false;

  // void showFavIemsOnly() {
  //   _showFavItemsOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showFavItemsOnly = false;
  //   notifyListeners();
  // }

  List<Product> get productList {
    // if (_showFavItemsOnly) {
    //   return _products.where((product) => product.isFavorite).toList();
    // }
    return [..._products];
  }

  List<Product> get favProduvtList {
    return _products.where((Product product) => product.isFavorite).toList();
  }

  void addProduct() {
    // _products.add(value);
    notifyListeners();
  }

  Product findbyId(String id) {
    return _products.firstWhere((product) => product.id == id);
  }
}
