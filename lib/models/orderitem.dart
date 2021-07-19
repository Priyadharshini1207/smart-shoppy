
import '../models/cartitem.dart';

class OrderItem {
  final String id;
  final List<CartItem> product;
  final DateTime dateTime;
  final double totalAmt;

  OrderItem(
      {required this.id,
      required this.product,
      required this.dateTime,
      required this.totalAmt});
}
