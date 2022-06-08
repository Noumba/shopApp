import 'package:flutter/material.dart';
import 'package:mytech1/screens/user_products_screen.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key, required this.pageController}) : super(key: key);
  final PageController pageController;

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  String _tileSelected = '';
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    final _myColor =
        ColorScheme.fromSwatch(primarySwatch: Colors.purple).secondary;
    return Drawer(
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
                  onTap: () {
                    setState(() {
                      _tileSelected = 'profile';
                    });
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
                  onTap: () {
                    setState(() {
                      _tileSelected = 'shop';
                    });
                    widget.pageController.jumpToPage(2);
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
                  onTap: () {
                    setState(() {
                      _tileSelected = 'orders';
                    });
                    widget.pageController.jumpToPage(3);
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
                  onTap: () {
                    setState(() {
                      _tileSelected = 'trans';
                    });
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
                  onTap: () {
                    setState(() {
                      _tileSelected = 'wish';
                    });
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
    );
  }
}
