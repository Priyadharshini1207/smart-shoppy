import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

import './widgets/product_grid.dart';
import '../../common_widgets/badge.dart';
import '../../providers/cart_providers.dart';
import '../cart/cart_overview_screen.dart';

enum FilterOptions { Favorite, ShowAll }

class ProductsOverviewScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _cartProvider =
        useMemoized(() => Provider.of<CartProvider>(context, listen: false));

    final _showFavOnly = useState(false);

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Consumer<CartProvider>(
            builder: (ctx, product, ch) => Badge(
              child: ch,
              value: _cartProvider.itemCount.toString(),
              color: Colors.red,
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartOverviewScreen.routeName);
              },
            ),
          ),
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            onSelected: (selectedValue) {
              selectedValue =
                  selectedValue == FilterOptions.Favorite ? true : false;
            },
            itemBuilder: (ctx) => [
              PopupMenuItem(
                child: Text('Favorites'),
                value: FilterOptions.Favorite,
              ),
              PopupMenuItem(
                  child: Text('Show All'), value: FilterOptions.ShowAll),
            ],
          ),
        ],
        title: Text('Smart Shoppy'),
      ),
      body: ProductGrid(_showFavOnly.value),
    );
  }
}
