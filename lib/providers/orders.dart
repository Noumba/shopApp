import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:mytech1/providers/cart.dart';

class Orders with ChangeNotifier {
  final List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  Future<void> addOrder(OrderItem orderItem) async {
    final url =
        Uri.https('myshop-b6eac-default-rtdb.firebaseio.com', '/orders.json');
    final response = await http
        .post(url,
            body: json.encode({
              'amount': orderItem.amount,
              'date': orderItem.dateTime.toString(),
              'products': orderItem.products
                  .map((e) => {
                        'id': e.id,
                        'title': e.title,
                        'quantity': e.quantity,
                        'price': e.price
                      })
                  .toList(),
            }))
        .then((response) {
      _orders.add(orderItem);
      notifyListeners();
    }).catchError((onError) {
      throw (onError);
    });
  }
}

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem(
      {required this.id,
      required this.amount,
      required this.products,
      required this.dateTime});
}
