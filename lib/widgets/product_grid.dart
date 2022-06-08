import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products_provider.dart';
import '../widgets/product_item.dart';

class ProductsGrid extends StatefulWidget {
  const ProductsGrid({required this.showOnlyFavorites, Key? key})
      : super(key: key);
  final bool showOnlyFavorites;

  @override
  _ProductsGridState createState() => _ProductsGridState();
}

class _ProductsGridState extends State<ProductsGrid> {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Productsproviders>(context);
    final products =
        widget.showOnlyFavorites ? productsData.favorites : productsData.items;

    return GridView.builder(
        physics: const ScrollPhysics(),
        itemCount: products.length,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 2.5,
            crossAxisSpacing: 5,
            mainAxisSpacing: 10),
        itemBuilder: (context, index) {
          return ChangeNotifierProvider.value(
            value: products[index],
            child: const ProductItem(),
          );
        });
  }
}
