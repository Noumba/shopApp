import 'dart:convert';

import 'package:flutter/foundation.dart';
//import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:mytech1/models/http_exception.dart';

import 'product.dart';

class Productsproviders with ChangeNotifier {
  List<Product> _items = [
    // Product(
    //   id: 'p1',
    //   title: 'Female jogging',
    //   description:
    //       'Warm and cozy - exactly what you need for the winter. Warm and cozy - exactly what you need for the winter Warm and cozy - exactly what you need for the winter',
    //   price: 19.99,
    //   url: 'asset/shorts2.jpg',
    // ),
    // Product(
    //   id: 'p2',
    //   title: 'Dior Classic',
    //   description: 'Warm and cozy - exactly what you need for the winter.',
    //   price: 19.99,
    //   url: 'asset/bag3.jpg',
    // ),
    // Product(
    //   id: 'p3',
    //   title: 'Classic Blue',
    //   description: 'Warm and cozy - exactly what you need for the winter.',
    //   price: 19.99,
    //   url: 'asset/bag2.jpg',
    // ),
    // Product(
    //   id: 'p4',
    //   title: 'LouisV bag',
    //   description: 'Warm and cozy - exactly what you need for the winter.',
    //   price: 19.99,
    //   url: 'asset/bag1.jpg',
    // ),
    // Product(
    //   id: 'p5',
    //   title: 'Channel bag',
    //   description: 'A red shirt - it is pretty red!',
    //   price: 29.99,
    //   url: 'asset/bag.jpg',
    // ),
    // Product(
    //   id: 'p6',
    //   title: 'Single Hand',
    //   description: 'A nice pair of trousers.',
    //   price: 59.99,
    //   url: 'asset/gawn1.jpg',
    // ),
    // Product(
    //   id: 'p7',
    //   title: 'White Gawn',
    //   description: 'Warm and cozy - exactly what you need for the winter.',
    //   price: 19.99,
    //   url: 'asset/gawn3.jpg',
    // ),
    // Product(
    //   id: 'p8',
    //   title: 'Black Angel',
    //   description: 'Prepare any meal you want.',
    //   price: 49.99,
    //   url: 'asset/gawn13.jpg',
    // ),
    // Product(
    //   id: 'p9',
    //   title: 'White Nike',
    //   description: 'Prepare any meal you want.',
    //   price: 49.99,
    //   url: 'asset/shoe1.jpg',
    // ),
    // Product(
    //   id: 'p10',
    //   title: 'Sneakers',
    //   description: 'Prepare any meal you want.',
    //   price: 49.99,
    //   url: 'asset/shoe2.jpg',
    // ),
  ];

  //var _showFavoritesOnly = false;
  /*bool _disposed = false;
  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }*/

  List<Product> get items {
    /*if (_showFavoritesOnly) {
      return _items.where((element) => element.isFavorite).toList();
    }*/
    return [..._items];
  }

  List<Product> get favorites {
    return _items.where((element) => element.isFavorite).toList();
  }

  /*void showFavoritesOnly() {
    _showFavoritesOnly = true;
    notifyListeners();
  }

  void showAll() {
    _showFavoritesOnly = false;
    notifyListeners();
  }*/

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  Future<void> addProduct(Product product) async {
    final url =
        Uri.https('myshop-b6eac-default-rtdb.firebaseio.com', '/products.json');
    await http
        .post(url,
            body: json.encode({
              'title': product.title,
              'description': product.description,
              'imageUrl': product.url,
              'price': product.price,
              'isFavorite': product.isFavorite
            }))
        .then((response) {
      _items.add(product);
      notifyListeners();
    }).catchError((onError) {
      throw (onError);
    });
    // final url2 = Uri.parse(
    //     'https://myshop-b6eac-default-rtdb.firebaseio.com/product.json');
    // http.post(url2,
    //     body: jsonEncode({
    //       'title': product.title,
    //       'description': product.description,
    //       'imageUrl': product.url,
    //       'price': product.price,
    //       'isFavorite': product.isFavorite
    //     }));
  }

  Future<void> fetchAndSetProducts() async {
    final url =
        Uri.https('myshop-b6eac-default-rtdb.firebaseio.com', '/products.json');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Product> loadedProducts = [];
      extractedData.forEach((prodId, product) {
        loadedProducts.add(Product(
            id: prodId,
            title: product['title'],
            description: product['description'],
            price: product['price'],
            isFavorite: product['isFavorite'],
            url: product['imageUrl']));
      });
      _items = loadedProducts;
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  int seachProduct(String id) {
    return _items.indexWhere((product) => product.id == id);
  }

  Future<void> addEditedProduct(int index, Product product) async {
    final url = Uri.https('myshop-b6eac-default-rtdb.firebaseio.com',
        '/products/${product.id}.json');
    try {
      var response = await http.patch(url,
          body: json.encode({
            'title': product.title,
            'description': product.description,
            'imageUrl': product.url,
            'price': product.price,
          }));
      print(url);
    } catch (error) {
      rethrow;
    }
    _items[index] = product;
    notifyListeners();
  }

  Future<void> deleteProduct(String id) async {
    final url = Uri.https(
        'myshop-b6eac-default-rtdb.firebaseio.com', '/products/$id.json');
    final existingProductIndex =
        _items.indexWhere((element) => element.id == id);
    Product? existingProduct = _items[existingProductIndex];
    _items.removeWhere((product) => product.id == id);
    notifyListeners();
    final resp = await http.delete(url).then((response) {
      if (response.statusCode >= 400) {
        throw HttpException(message: "Could not delete product");
      }
      existingProduct = null;
    }).catchError((_) {
      _items.insert(existingProductIndex, existingProduct!);
      notifyListeners();
    });
  }
}
