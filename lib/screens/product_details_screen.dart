import 'package:flutter/material.dart';
import 'package:mytech1/models/custom_radio.dart';
import 'package:mytech1/providers/cart.dart';
import 'package:mytech1/providers/product.dart';
import 'package:mytech1/providers/products_provider.dart';
import 'package:mytech1/screens/radio_item.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  //final String title;
  const ProductDetailsScreen({Key? key}) : super(key: key);
  static const routeName = '/productDetails';

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final List<RadioModel> _customRadio = [];
  final List<RadioModel> _customRadioSizes = [];
  final _sizSelectedColor =
      ColorScheme.fromSwatch(primarySwatch: Colors.purple).secondary;
  @override
  void initState() {
    // TODO: implement initState
    _customRadio.add(RadioModel(false, 'White', Colors.white));
    _customRadio.add(RadioModel(false, 'Red', Colors.red));
    _customRadio.add(RadioModel(false, 'Blue', Colors.blue));
    _customRadio.add(RadioModel(false, 'Yellow', Colors.yellow));

    _customRadioSizes.add(RadioModel(false, 'SM', _sizSelectedColor));
    _customRadioSizes.add(RadioModel(false, 'L', _sizSelectedColor));
    _customRadioSizes.add(RadioModel(false, 'XL', _sizSelectedColor));
    _customRadioSizes.add(RadioModel(false, 'XX', _sizSelectedColor));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as Product;
    final product = Provider.of<Productsproviders>(context, listen: true)
        .findById(productId.id);
    final cart = Provider.of<Cart>(context, listen: true);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            size: 22,
            color: Colors.white,
          ),
        ),
        automaticallyImplyLeading: false,
        title: Text(
          product.title,
          style: const TextStyle(
            fontFamily: 'sans serif',
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        elevation: 0.0,
        backgroundColor: Colors.black26,
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 5.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
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
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.shopping_cart_outlined),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('ADD TO CART'),
                  )
                ],
              )),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.55,
              decoration: BoxDecoration(border: Border.all(width: 0.0)),
              child: Image(
                image: NetworkImage(product.url),
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Flexible(
              fit: FlexFit.loose,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Text(
                          //'\$',
                          'XAF ',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'times'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 6.0),
                          child: Text(
                            '${product.price}',
                            style: const TextStyle(
                                fontSize: 24,
                                color: Colors.black87,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'times'),
                          ),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        ChangeNotifierProvider<Product>.value(
                          value: productId,
                          child: Consumer<Product>(
                            builder: (BuildContext context, value, _) {
                              return ProductDetailsFavIcon(
                                  productId: productId, product: product);
                            },
                            // child: productDetailsFavIcon(productId: productId, product: product),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const FittedBox(
                            fit: BoxFit.contain,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Available colors',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: _customRadio
                                .map((e) => GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          for (var element in _customRadio) {
                                            element.isSelected = false;
                                          }
                                          e.isSelected = true;
                                        });
                                      },
                                      child: RadioItem(
                                        radioItem: e,
                                      ),
                                    ))
                                .toList(),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const FittedBox(
                            fit: BoxFit.contain,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Available Sizes',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: _customRadioSizes
                                .map((e) => GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          for (var element
                                              in _customRadioSizes) {
                                            element.isSelected = false;
                                          }
                                          e.isSelected = true;
                                        });
                                      },
                                      child: RadioItem(
                                        radioItem: e,
                                      ),
                                    ))
                                .toList(),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const FittedBox(
                            fit: BoxFit.contain,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Description',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        product.description,
                        style: const TextStyle(color: Colors.black54),
                        softWrap: true,
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProductDetailsFavIcon extends StatelessWidget {
  const ProductDetailsFavIcon({
    Key? key,
    required this.productId,
    required this.product,
  }) : super(key: key);

  final Product productId;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        alignment: Alignment.bottomRight,
        onPressed: () async {
          await productId.toogleFavoriteStatus(productId.id);
        },
        icon: Icon(
          productId.isFavorite
              ? Icons.favorite
              : Icons.favorite_border_outlined,
          color: productId.isFavorite ? Colors.red : Colors.orange,
        ));
  }
}
