import 'package:flutter/material.dart';
import 'package:mytech1/providers/products_provider.dart';
import 'package:mytech1/screens/edit_product_screen.dart';
import 'package:mytech1/widgets/user_product_item.dart';
import 'package:provider/provider.dart';

class UserProductScreen extends StatelessWidget {
  static const String routeName = '/userProductScreen';
  const UserProductScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Productsproviders>(context);
    return Scaffold(
      //drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, EditProductScreen.routeName);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1.0, vertical: 1.0),
        child: ListView.builder(
            itemCount: productData.items.length,
            itemBuilder: (context, index) => Column(
                  children: [
                    UserProductItem(
                      title: productData.items[index].title,
                      imageUrl: productData.items[index].url,
                      prodIdl: productData.items[index].id,
                    ),
                    const Divider()
                  ],
                )),
      ),
    );
  }
}
