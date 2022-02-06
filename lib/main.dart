import 'package:flutter/material.dart';
import 'package:mytech1/providers/cart.dart';
import 'package:mytech1/providers/orders.dart';
import 'package:mytech1/screens/cart_screen.dart';
import 'package:mytech1/screens/edit_product_screen.dart';
import 'package:mytech1/screens/order_screen.dart';
import 'package:mytech1/screens/user_products_screen.dart';
import 'package:provider/provider.dart';

import 'package:mytech1/screens/product_details_screen.dart';
import 'package:mytech1/screens/product_overview_screens.dart';

import './providers/products_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Productsproviders(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(create: (ctx) => Orders()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
                .copyWith(secondary: Colors.deepOrange)),
        home: const ProductsOverviewScreen(),
        routes: {
          ProductDetailsScreen.routeName: (ctx) => const ProductDetailsScreen(),
          CartScreen.route: (ctx) => const CartScreen(),
          OrderScreen.routeName: (ctx) => const OrderScreen(),
          UserProductScreen.routeName: (ctx) => const UserProductScreen(),
          EditProductScreen.routeName: (ctx) => const EditProductScreen()
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[700]!.withBlue(650),
        title: Text(
          widget.title,
          textScaleFactor: 1.15,
          style: TextStyle(
              color: Colors.white70.withOpacity(0.95), fontFamily: 'serif'),
        ),
      ),
      endDrawer: const Drawer(),
      body: Container(
        color: Colors.grey.shade400,
      ),
    );
  }
}
