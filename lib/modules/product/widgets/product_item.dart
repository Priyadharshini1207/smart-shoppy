import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/cart_providers.dart';
import '../../../providers/product.dart';
import '../product_details_screen.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Product _product = Provider.of<Product>(context);
    final _cartProvider = Provider.of<CartProvider>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed(ProductDetailScreen.routeName, arguments: _product.id);
          },
          child: Image.network(
            _product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          // leading: Consumer(
          //   builder: (context, value, child) => IconButton(
          //     color: Colors.red,
          //     icon: Icon(
          //       value.isFavorite ? Icons.favorite : Icons.favorite_border,
          //     ),
          //     onPressed: () {
          //       value.toogleIsFavorite();
          //     },
          //   ),
          // ),
          leading: IconButton(
            color: Colors.red,
            icon: Icon(
              _product.isFavorite ? Icons.favorite : Icons.favorite_border,
            ),
            onPressed: () {
              _product.toogleIsFavorite();
            },
          ),
          title: Text(
            _product.title,
            // textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {
              _cartProvider.addItem(
                  _product.id, _product.title, _product.price);
            },
          ),
        ),
      ),
    );
  }
}
