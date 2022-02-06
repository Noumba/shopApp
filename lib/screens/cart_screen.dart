import 'package:flutter/material.dart';
import 'package:mytech1/providers/cart.dart';
import 'package:mytech1/providers/orders.dart';
import 'package:provider/provider.dart';
import '../widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const route = '/cart';
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
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
                  TextButton(
                      onPressed: () {
                        final orderItem = OrderItem(
                            id: DateTime.now().toString(),
                            amount: cart.totalAmount,
                            products: cart.items.values.toList(),
                            dateTime: DateTime.now());
                        Provider.of<Orders>(context, listen: false)
                            .addOrder(orderItem);
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
