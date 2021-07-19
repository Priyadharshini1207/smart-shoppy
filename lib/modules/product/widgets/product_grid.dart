import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './product_item.dart';
import '../../../providers/product.dart';
import '../../../providers/products_providers.dart';

class ProductGrid extends StatelessWidget {
  final _showFavItems;

  const ProductGrid(this._showFavItems);

  @override
  Widget build(BuildContext context) {
    final _productsProvider = Provider.of<ProductsProvider>(context);
    List<Product> products = _showFavItems
        ? _productsProvider.favProduvtList
        : _productsProvider.productList;

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: ((context, i) {      
        return ChangeNotifierProvider.value(
          value: products[i],
          child: ProductItem(),
        );
      }),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 3 / 2,
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8),
    );
  }
}
