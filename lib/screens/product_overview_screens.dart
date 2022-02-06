import 'package:flutter/material.dart';
import 'package:mytech1/providers/cart.dart';
import 'package:mytech1/providers/products_provider.dart';
import 'package:mytech1/screens/cart_screen.dart';
import 'package:mytech1/widgets/app_drawer.dart';
import 'package:mytech1/widgets/badge.dart';
import 'package:provider/provider.dart';

import '../widgets/product_grid.dart';

enum filterOptions { Favorites, All }

class ProductsOverviewScreen extends StatefulWidget {
  const ProductsOverviewScreen({Key? key}) : super(key: key);

  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Productsproviders>(context);
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('MySHop'),
        actions: [
          Consumer<Cart>(
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.route);
                },
                icon: const Icon(Icons.shopping_cart_outlined)),
            builder: (_, cart, ch) => Badge(
                child: ch!,
                value: cart.itemCount.toString(),
                color: Colors.blue),
          ),
          PopupMenuButton(
              onSelected: (filterOptions selectedValue) {
                if (selectedValue == filterOptions.Favorites) {
                  setState(() {
                    _showOnlyFavorites = true;
                  });
                } else {
                  setState(() {
                    _showOnlyFavorites = false;
                  });
                }
              },
              icon: const Icon(Icons.more_vert),
              itemBuilder: (_) => [
                    const PopupMenuItem(
                      child: Text('Show All'),
                      value: filterOptions.All,
                    ),
                const PopupMenuItem(
                      child: Text('Only Favorites'),
                      value: filterOptions.Favorites,
                    )
                  ])
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
        child: ProductsGrid(
          showOnlyFavorites: _showOnlyFavorites,
        ),
      ),
    );
  }
}
