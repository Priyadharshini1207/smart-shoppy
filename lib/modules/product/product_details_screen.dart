import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/product.dart';
import '../../providers/products_providers.dart';

class ProductDetailScreen extends StatelessWidget {
  static const String routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final String productId =
        ModalRoute.of(context)!.settings.arguments as String;

    final Product _product =
        Provider.of<ProductsProvider>(context).findbyId(productId);
    print('ProductDetail build');

    return Scaffold(
      appBar: AppBar(
        title: Text(_product.title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Image.network(
                _product.imageUrl,
                height: 300,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Text(
                '${_product.title} - ${_product.desc}',
                softWrap: true,
              ),
            ),

            // IconButton(
            //   color: Colors.red,
            //   icon: Icon(
            //     _product.isFavorite ? Icons.favorite : Icons.favorite_border,
            //   ),
            //   onPressed: () {
            //     print(_product.isFavorite);
            //     _product.toogleIsFavorite();
            //     print(_product.isFavorite);
            //   },
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Container(
            //     child: Text(
            //   '${_product.title} - ${_product.desc}',
            //   softWrap: true,
            // ))
          ],
        ),
      ),
    );
  }
}
