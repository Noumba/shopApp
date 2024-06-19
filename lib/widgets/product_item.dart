import 'package:flutter/material.dart';
import 'package:mytech1/providers/cart.dart';
import 'package:mytech1/providers/product.dart';
import 'package:mytech1/screens/product_details_screen.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key}) : super(key: key);

  /*final String id;
  final String title;
  final String imageUrl;

  ProductItem({required this.id, required this.title, required this.imageUrl});*/

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: true);
    final cart = Provider.of<Cart>(context, listen: true);

    return ClipRRect(
      child: GridTile(
        header: GridTileBar(
          backgroundColor: Colors.black12,
          title: const SizedBox(
            width: 20.0,
            child: Text(''),
          ),
          // leading: IconButton(
          //     onPressed: () {
          //       product.toogleFavoriteStatus();
          //     },
          //     icon: Icon(
          //       product.isFavorite
          //           ? Icons.favorite
          //           : Icons.favorite_border_outlined,
          //       color: product.isFavorite ? Colors.red : Colors.orange,
          //     )),
          trailing: IconButton(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(left: 5.0),
              color: Colors.yellowAccent,
              onPressed: () {
                cart.addItem(product.id, product.price, product.title);
                ScaffoldMessenger.of(context).removeCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: const Text('Added Item to Cart!!'),
                  duration: const Duration(seconds: 2),
                  action: SnackBarAction(
                      label: 'UNDO',
                      onPressed: () {
                        cart.removeSingleItem(product.id);
                      }),
                ));
              },
              icon: const Icon(Icons.shopping_cart_outlined)),
        ),
        footer: GridTileBar(
          trailing: IconButton(
              alignment: Alignment.bottomRight,
              onPressed: () async {
                await product.toogleFavoriteStatus(product.id);
              },
              icon: Icon(
                product.isFavorite
                    ? Icons.favorite
                    : Icons.favorite_border_outlined,
                color: product.isFavorite ? Colors.red : Colors.orange,
              )),
          leading: SizedBox(
            width: 90,
            child: Text(
              product.title,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white70,
                  fontFamily: 'sans serif'),
            ),
          ),
          backgroundColor: Colors.black54,
          title: const SizedBox(
            width: 20.0,
            child: Text(' '),
          ),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed(ProductDetailsScreen.routeName, arguments: product);
          },
          child: Image(
            image: NetworkImage(product.url),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
