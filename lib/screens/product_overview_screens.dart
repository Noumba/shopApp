import 'package:flutter/material.dart';
import 'package:mytech1/providers/cart.dart';
import 'package:mytech1/providers/products_provider.dart';
import 'package:mytech1/screens/cart_screen.dart';
import 'package:mytech1/widgets/app_drawer.dart';
import 'package:mytech1/widgets/badge.dart';
import 'package:mytech1/widgets/product_grid.dart';
import 'package:provider/provider.dart';

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
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined), label: 'Cart')
      ]),
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text(
          'Welcome',
          style: TextStyle(
            fontFamily: 'sans serif',
            fontSize: 22,
          ),
        ),
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
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        primary: true,
        clipBehavior: Clip.hardEdge,
        slivers: [
          SliverAppBar(
            primary: true,
            automaticallyImplyLeading: false,
            collapsedHeight: MediaQuery.of(context).size.height * 0.08,
            toolbarHeight: MediaQuery.of(context).size.height * 0.08,
            expandedHeight: MediaQuery.of(context).size.height * 0.2,
            snap: true,
            pinned: true,
            floating: true,
            backgroundColor: Colors.transparent,
            centerTitle: false,
            elevation: 2.0,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding:
                  const EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
              title: TextFormField(
                style: const TextStyle(
                  fontSize: 12.0,
                ),
                textAlign: TextAlign.start,
                enableSuggestions: true,
                decoration: const InputDecoration(
                  alignLabelWithHint: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 5),
                  hintText: 'search',
                  hintStyle: TextStyle(),
                  constraints: BoxConstraints(maxHeight: 25, minHeight: 25),
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(2.0)),
                      borderSide: BorderSide(style: BorderStyle.solid)),
                ),
              ),
              centerTitle: false,
              background: const Text('Da Vinci'),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            ProductsGrid(
              showOnlyFavorites: _showOnlyFavorites,
            ),
          ]))
        ],
      ),
    );
  }
}
