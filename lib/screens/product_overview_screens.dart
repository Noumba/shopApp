//import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mytech1/providers/cart.dart';
import 'package:mytech1/providers/products_provider.dart';
import 'package:mytech1/screens/cart_screen.dart';
import 'package:mytech1/screens/order_screen.dart';
import 'package:mytech1/screens/transaction_screen.dart';
import 'package:mytech1/screens/user_products_screen.dart';
import 'package:mytech1/screens/wishlist_screen.dart';
import 'package:mytech1/widgets/badge.dart' as badge;
import 'package:mytech1/widgets/product_grid.dart';
import 'package:provider/provider.dart';

import 'profile_screen.dart';

enum FilterOptions { favorites, all }

class ProductsOverviewScreen extends StatefulWidget {
  const ProductsOverviewScreen({Key? key}) : super(key: key);
  static const routeName = '/productOverViewScreen';

  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;
  int _selectedIndex = 0;
  final _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  String _tileSelected = '';

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(_selectedIndex);
  }

  void _onSelectPage(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _bottomNavScreen = [
      ProductOverview(showOnlyFavorites: _showOnlyFavorites),
      const CartScreen()
    ];

    var height = MediaQuery.of(context).size.height;
    final _myColor =
        ColorScheme.fromSwatch(primarySwatch: Colors.purple).secondary;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          selectedIconTheme:
              const IconThemeData(color: Colors.orange, opacity: 1.0, size: 26),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          unselectedIconTheme: const IconThemeData(
              color: Colors.white70, opacity: 1.0, size: 21),
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w800),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w400),
          selectedItemColor: Colors.orange,
          elevation: 5.0,
          backgroundColor:
              ColorScheme.fromSwatch(primarySwatch: Colors.purple).primary,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: <BottomNavigationBarItem>[
            const BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: 'Home'),
            BottomNavigationBarItem(
                icon: Consumer<Cart>(
                  child: const Padding(
                    padding: EdgeInsets.only(top: 12, right: 14),
                    child: Icon(
                      Icons.shopping_cart_outlined,
                    ),
                  ),
                  builder: (_, cart, ch) => Padding(
                    padding: const EdgeInsets.only(left: 14),
                    child: badge.Badge(
                        child: ch!,
                        value: cart.itemCount.toString(),
                        color: Colors.blue),
                  ),
                ),
                label: 'Cart')
          ]),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              height: height * 0.4,
              width: double.infinity,
              color: _myColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    image: const AssetImage('asset/man.png'),
                    height: height * 0.19,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    child: FittedBox(
                      child: Text(
                        'Noumba Leonard',
                        style: TextStyle(
                            fontFamily: 'sans serif',
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  const FittedBox(
                    child: Text(
                      'n.leonardeinstein@gmail.com',
                      style: TextStyle(
                          fontFamily: 'sans serif',
                          fontSize: 16,
                          color: Colors.white70),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const Divider(
                    height: 0,
                  ),
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: Text(
                      'Profile',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'serif',
                          fontWeight: FontWeight.w500,
                          color: _tileSelected == 'profile'
                              ? _myColor
                              : Colors.grey[700]?.withOpacity(1.0)),
                    ),
                    onTap: () async {
                      setState(() {
                        _tileSelected = 'profile';
                      });
                      _pageController.jumpToPage(4);
                      await Future.delayed(const Duration(seconds: 1));

                      Navigator.pop(context);
                    },
                    style: ListTileStyle.drawer,
                    selected: _tileSelected == 'profile',
                    selectedColor: _myColor,
                    selectedTileColor: _myColor.withOpacity(0.2),
                  ),
                  const Divider(
                    height: 0,
                  ),
                  ListTile(
                    leading: const Icon(Icons.shop_2),
                    title: Text(
                      'Shop',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'serif',
                          fontWeight: FontWeight.w500,
                          color: _tileSelected == 'shop'
                              ? _myColor
                              : Colors.grey[700]?.withOpacity(1.0)),
                    ),
                    onTap: () async {
                      setState(() {
                        _tileSelected = 'shop';
                      });
                      _pageController.jumpToPage(2);
                      await Future.delayed(const Duration(seconds: 1));

                      Navigator.pop(context);
                    },
                    selected: _tileSelected == 'shop',
                    selectedColor: _myColor,
                    selectedTileColor: _myColor.withOpacity(0.2),
                  ),
                  const Divider(
                    height: 0,
                  ),
                  ListTile(
                    leading: const Icon(Icons.shopping_basket_outlined),
                    title: Text(
                      'Orders',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'serif',
                          fontWeight: FontWeight.w500,
                          color: _tileSelected == 'orders'
                              ? _myColor
                              : Colors.grey[700]?.withOpacity(1.0)),
                    ),
                    onTap: () async {
                      setState(() {
                        _tileSelected = 'orders';
                      });
                      _pageController.jumpToPage(3);
                      await Future.delayed(const Duration(seconds: 1));
                      Navigator.pop(context);
                    },
                    selected: _tileSelected == 'orders',
                    selectedColor: _myColor,
                    selectedTileColor: _myColor.withOpacity(0.2),
                  ),
                  const Divider(
                    height: 0,
                  ),
                  ListTile(
                    leading: const Icon(Icons.money),
                    title: Text(
                      'Transactions',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'serif',
                          fontWeight: FontWeight.w500,
                          color: _tileSelected == 'trans'
                              ? _myColor
                              : Colors.grey[700]?.withOpacity(1.0)),
                    ),
                    onTap: () async {
                      setState(() {
                        _tileSelected = 'trans';
                      });
                      _pageController.jumpToPage(5);
                      await Future.delayed(const Duration(seconds: 1));
                      Navigator.pop(context);
                    },
                    selected: _tileSelected == 'trans',
                    selectedColor: _myColor,
                    selectedTileColor: _myColor.withOpacity(0.2),
                  ),
                  const Divider(
                    height: 0,
                  ),
                  ListTile(
                    leading: const Icon(Icons.favorite_border_rounded),
                    title: Text(
                      'Wish List',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'serif',
                          fontWeight: FontWeight.w500,
                          color: _tileSelected == 'wish'
                              ? _myColor
                              : Colors.grey[700]?.withOpacity(1.0)),
                    ),
                    onTap: () async {
                      setState(() {
                        _tileSelected = 'wish';
                      });
                      _pageController.jumpToPage(6);
                      await Future.delayed(const Duration(seconds: 1));
                      Navigator.pop(context);
                    },
                    selected: _tileSelected == 'wish',
                    selectedColor: _myColor,
                    selectedTileColor: _myColor.withOpacity(0.2),
                  ),
                  const Divider(
                    height: 0,
                  ),
                  SizedBox(
                    height: height * 0.08,
                  ),
                  const Divider(
                    height: 0,
                  ),
                  ListTile(
                    leading: const Icon(Icons.mode_edit),
                    title: Text(
                      'Products',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'serif',
                          fontWeight: FontWeight.w500,
                          color: _tileSelected == 'products'
                              ? _myColor
                              : Colors.grey[700]?.withOpacity(1.0)),
                    ),
                    onTap: () {
                      setState(() {
                        _tileSelected = 'products';
                      });
                      Navigator.pushReplacementNamed(
                          context, UserProductScreen.routeName);
                    },
                    selected: _tileSelected == 'products',
                    selectedColor: _myColor,
                    selectedTileColor: _myColor.withOpacity(0.2),
                  ),
                  ListTile(
                    leading: const Icon(Icons.share),
                    title: Text(
                      'Tell a Friend',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'serif',
                          fontWeight: FontWeight.w500,
                          color: _tileSelected == 'tell'
                              ? _myColor
                              : Colors.grey[700]?.withOpacity(1.0)),
                    ),
                    onTap: () {
                      setState(() {
                        _tileSelected = 'tell';
                      });
                    },
                    selected: _tileSelected == 'tell',
                    selectedColor: _myColor,
                    selectedTileColor: _myColor.withOpacity(0.2),
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout_rounded),
                    title: Text(
                      'Logout',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'serif',
                          fontWeight: FontWeight.w500,
                          color: _tileSelected == 'logout'
                              ? _myColor
                              : Colors.grey[700]?.withOpacity(1.0)),
                    ),
                    onTap: () {
                      setState(() {
                        _tileSelected = 'logout';
                      });
                    },
                    selectedColor: _myColor,
                    selectedTileColor: _myColor.withOpacity(0.2),
                    selected: _tileSelected == 'logout',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          _currentPage == 1
              ? 'CART'
              : _currentPage == 3
                  ? 'YOUR ORDER'
                  : _currentPage == 4
                      ? 'PROFILE'
                      : _currentPage == 5
                          ? 'TRANSACTIONS'
                          : 'LDV FASHION',
          style: const TextStyle(
            fontFamily: 'sans serif',
            fontSize: 18,
          ),
        ),
        actions: [
          // Consumer<Cart>(
          //   child: IconButton(
          //       onPressed: () {
          //         Navigator.of(context).pushNamed(CartScreen.route);
          //       },
          //       icon: const Icon(Icons.shopping_cart_outlined)),
          //   builder: (_, cart, ch) => Badge(
          //       child: ch!,
          //       value: cart.itemCount.toString(),
          //       color: Colors.blue),
          // ),
          PopupMenuButton(
              onSelected: (FilterOptions selectedValue) {
                if (selectedValue == FilterOptions.favorites) {
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
                      value: FilterOptions.all,
                    ),
                    const PopupMenuItem(
                      child: Text('Only Favorites'),
                      value: FilterOptions.favorites,
                    )
                  ])
        ],
      ),
      // body: _bottomNavScreen.elementAt(_selectedIndex),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onSelectPage,
        children: [
          ProductOverview(showOnlyFavorites: _showOnlyFavorites),
          const CartScreen(),
          ProductOverview(showOnlyFavorites: _showOnlyFavorites),
          const OrderScreen(),
          const ProfileScreen(),
          const Transactions(),
          const WishListScreen()
        ],
      ),
    );
  }
}

class ProductOverview extends StatefulWidget {
  const ProductOverview({
    Key? key,
    required bool showOnlyFavorites,
  })  : _showOnlyFavorites = showOnlyFavorites,
        super(key: key);

  final bool _showOnlyFavorites;

  @override
  State<ProductOverview> createState() => _ProductOverviewState();
}

class _ProductOverviewState extends State<ProductOverview>
    with AutomaticKeepAliveClientMixin<ProductOverview> {
  var _isInit = true;
  var _isloading = false;

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    if (_isInit) {
      setState(() {
        _isloading = true;
      });
      Provider.of<Productsproviders>(context)
          .fetchAndSetProducts()
          .then((value) {
        setState(() {
          _isloading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final productData = Provider.of<Productsproviders>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
      child: CustomScrollView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        primary: true,
        clipBehavior: Clip.hardEdge,
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.25,
            primary: true,
            automaticallyImplyLeading: false,
            collapsedHeight: MediaQuery.of(context).size.height * 0.1,
            toolbarHeight: MediaQuery.of(context).size.height * 0.1,
            // snap: true,
            pinned: true,
            // floating: true,
            backgroundColor: Colors.grey.shade700.withOpacity(0.7),
            centerTitle: false,
            elevation: 2.0,
            // shape: RoundedRectangleBorder(
            //     side: BorderSide(
            //         style: BorderStyle.solid,
            //         color: Theme.of(context).primaryColor),
            //     borderRadius: const BorderRadius.only(
            //         bottomLeft: Radius.circular(5.0),
            //         bottomRight: Radius.circular(5.0))),

            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [
                StretchMode.zoomBackground,
              ],
              titlePadding:
                  const EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
              background: Image(
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width * 1,
                image: const AssetImage('asset/bag3.jpg'),
              ),
              centerTitle: false,
              title: const CupertinoSearchTextField(
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: 'serif',
                    decoration: TextDecoration.none),
                decoration: BoxDecoration(
                    color: Colors.white54,
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
              child: ListView(
                primary: true,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: Card(
                      color: Colors.white.withOpacity(0.8),
                      elevation: 3.0,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Image(
                              image: AssetImage('asset/jacket.png'),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(1.0),
                            child: Text(
                              'MEN',
                              maxLines: 1,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: Card(
                      color: Colors.white.withOpacity(0.8),
                      elevation: 3.0,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Image(
                              image: AssetImage('asset/tote-bag.png'),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(1.0),
                            child: Text(
                              'WOMEN',
                              maxLines: 1,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: Card(
                      color: Colors.white.withOpacity(0.8),
                      elevation: 3.0,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Image(
                              image: AssetImage('asset/jeans.png'),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(1.0),
                            child: Text(
                              'KIDS',
                              maxLines: 1,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: Card(
                      color: Colors.white.withOpacity(0.8),
                      elevation: 3.0,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Image(
                              image: AssetImage('asset/pants.png'),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(1.0),
                            child: Text(
                              'CLOTHING',
                              maxLines: 1,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: Card(
                      color: Colors.white.withOpacity(0.8),
                      elevation: 3.0,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(0.0),
                            child: Image(
                              image: AssetImage('asset/shoe1.jpg'),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(1.0),
                            child: Text(
                              'SHOES',
                              maxLines: 1,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            _isloading
                ? Container(
                    margin: const EdgeInsets.only(top: 50),
                    child: const Center(child: CircularProgressIndicator()))
                : ProductsGrid(
                    showOnlyFavorites: widget._showOnlyFavorites,
                  ),
          ]))
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
