import 'package:flutter/material.dart';
import 'package:mytech1/screens/order_screen.dart';
import 'package:mytech1/screens/product_overview_screens.dart';
import 'package:mytech1/screens/user_products_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: const Text('Hello Friend'),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.shop_2),
            title: const Text('Shop'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (ctx) => ProductsOverviewScreen()));
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.shopping_basket_outlined),
            title: const Text('Orders'),
            onTap: () {
              Navigator.pushReplacementNamed(context, OrderScreen.routeName);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.mode_edit),
            title: const Text('Manage products'),
            onTap: () {
              Navigator.pushReplacementNamed(
                  context, UserProductScreen.routeName);
            },
          )
        ],
      ),
    );
  }
}
