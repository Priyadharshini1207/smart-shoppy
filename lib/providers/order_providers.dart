import 'package:flutter/material.dart';
import '../models/cartitem.dart';
import '../models/orderitem.dart';

class OrdersProvider with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> orderItems, double amount) {
    _orders.insert(
        0,
        OrderItem(
          id: DateTime.now().toString(),
          product: orderItems,
          dateTime: DateTime.now(),
          totalAmt: amount,
        ));
    notifyListeners();
  }
}
