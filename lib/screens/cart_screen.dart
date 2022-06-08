import 'package:flutter/material.dart';
import 'package:mytech1/providers/cart.dart';
import 'package:mytech1/providers/orders.dart';
import 'package:provider/provider.dart';

import '../widgets/cart_item.dart';

class CartScreen extends StatefulWidget {
  static const route = '/cart';
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  var isLoading = false;
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(7.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total: ',
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Spacer(),
                  Chip(
                    label: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text('\$${cart.totalAmount.toStringAsFixed(2)}',
                            style: const TextStyle(
                              color: Colors.white,
                            )),
                      ),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  isLoading
                      ? const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.0),
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : TextButton(
                          onPressed: cart.totalAmount <= 0
                              ? null
                              : () async {
                                  setState(() {
                                    isLoading = !isLoading;
                                  });
                                  final orderItem = OrderItem(
                                      id: DateTime.now().toString(),
                                      amount: cart.totalAmount,
                                      products: cart.items.values.toList(),
                                      dateTime: DateTime.now());
                                  await Provider.of<Orders>(context,
                                          listen: false)
                                      .addOrder(orderItem);
                                  setState(() {
                                    isLoading = !isLoading;
                                  });
                                  cart.clearCart();
                                },
                          child: const Text('Make Order'))
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: cart.items.length,
                  itemBuilder: (context, index) => CartItems(
                      id: cart.items.values.toList()[index].id,
                      prodId: cart.items.keys.toList()[index],
                      title: cart.items.values.toList()[index].title,
                      quantity:
                          cart.items.values.toList()[index].quantity.toDouble(),
                      price: cart.items.values.toList()[index].price)))
        ],
      ),
    );
  }
}
