import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String url;
  bool isFavorite;

  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.url,
      this.isFavorite = false});

  void toogleFavoriteStatus() {
    final oldStatus = isFavorite;
    isFavorite = !isFavorite;
    const url = 'myshop-b6eac-default-rtdb.firebaseio.com';
    notifyListeners();
  }
}
