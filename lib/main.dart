import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './modules/cart/cart_overview_screen.dart';
import './modules/product/products_overview_screen.dart';
import './modules/product/product_details_screen.dart';
import './providers/cart_providers.dart';
import './providers/order_providers.dart';
import './providers/products_providers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: ProductsProvider(),
        ),
        ChangeNotifierProvider.value(
          value: CartProvider(),
        ),
        ChangeNotifierProvider.value(
          value: OrdersProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Smart Shoppy',
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartOverviewScreen.routeName: (ctx) => CartOverviewScreen(),
        },
      ),
    );
  }
}
