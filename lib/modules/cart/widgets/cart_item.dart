import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/cart_providers.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String productId;
  final String title;
  final double price;
  final int quantity;

  CartItem(this.id, this.productId, this.title, this.price, this.quantity);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        alignment: Alignment.centerRight,
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        padding: EdgeInsets.only(right: 12),
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (_) {
        Provider.of<CartProvider>(context, listen: false).removeItem(productId);
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: FittedBox(
                    child: Text(
                  '₹ $price',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
              ),
            ),
            title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('₹ ${price * quantity}'),
            trailing: Text(' $quantity *'),
          ),
        ),
      ),
    );
  }
}
