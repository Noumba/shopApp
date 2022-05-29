import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

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

  Future<void> toogleFavoriteStatus(String id) async {
    final oldStatus = isFavorite;
    isFavorite = !isFavorite;
    final url = Uri.https(
        'myshop-b6eac-default-rtdb.firebaseio.com', '/products/$id.json');
    try {
      var response =
          await http.patch(url, body: json.encode({'isFavorite': isFavorite}));
    } catch (error) {
      rethrow;
    }
    notifyListeners();
  }
}
