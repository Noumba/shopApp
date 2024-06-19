import 'package:flutter/material.dart';
import 'package:mytech1/providers/cart.dart';
import 'package:provider/provider.dart';

class CartItems extends StatelessWidget {
  final String id;
  final String prodId;
  final double price;
  final double quantity;
  final String title;
  const CartItems(
      {Key? key,
      required this.id,
      required this.prodId,
      required this.price,
      required this.quantity,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).colorScheme.error,
        alignment: Alignment.centerRight,
        child: const Icon(
          Icons.delete,
          size: 40,
          color: Colors.white70,
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: const Text('Are you sure?'),
                  content: const Text('Do you want to remove item from cart?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      child: const Text(
                        'NO',
                        textAlign: TextAlign.end,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                        child: const Text(
                          'YES',
                          textAlign: TextAlign.end,
                        ))
                  ],
                ));
      },
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(prodId);
        print('Cart Item $prodId removed from cart');
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
              leading: CircleAvatar(
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: FittedBox(child: Text('\$$price')),
                ),
              ),
              title: Text(title),
              subtitle: Text('\$${quantity * price}'),
              trailing: PopupMenuButton(
                itemBuilder: (context) => [],
                icon: const Icon(Icons.more_vert),
              )),
        ),
      ),
    );
  }
}
