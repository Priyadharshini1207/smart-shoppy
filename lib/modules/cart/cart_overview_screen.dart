import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

import '../../providers/cart_providers.dart';
import '../../providers/order_providers.dart';
// import '../models/cartitem.dart';
import 'widgets/cart_item.dart'
    as ci; // since model & widget folders has CartItem as classname

class CartOverviewScreen extends HookWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    // final _cartProvider = Provider.of<CartProvider>(context);
    final _cartProvider = useMemoized(() => Provider.of<CartProvider>(context));
    useEffect(() {
      _cartProvider.items;
    }, const []);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(12),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    'Total',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Chip(
                    label: FittedBox(
                        child: Text(
                            '₹ ${_cartProvider.totalAmt.toStringAsFixed(2)}')),
                  ),
                  TextButton(
                    child: Text(
                      'Order Now',
                      style: TextStyle(color: Colors.blue),
                    ),
                    onPressed: () {
                      Provider.of<OrdersProvider>(context, listen: false)
                          .addOrder(_cartProvider.items.values.toList(),
                              _cartProvider.totalAmt);
                      _cartProvider.clear();
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _cartProvider.items.length,
              itemBuilder: (ctx, i) => ci.CartItem(
                  _cartProvider.items.values.toList()[i].id,
                  _cartProvider.items.keys.toList()[i],
                  _cartProvider.items.values.toList()[i].title,
                  _cartProvider.items.values.toList()[i].price,
                  _cartProvider.items.values.toList()[i].quantity),
            ),
          )
        ],
      ),
    );
  }
}
