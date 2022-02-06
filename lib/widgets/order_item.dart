import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:mytech1/providers/orders.dart';

class OrderItems extends StatefulWidget {
  final OrderItem orderItem;
  const OrderItems({Key? key, required this.orderItem}) : super(key: key);

  @override
  _OrderItemsState createState() => _OrderItemsState();
}

class _OrderItemsState extends State<OrderItems> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('\$${widget.orderItem.amount}'),
            subtitle: Text(DateFormat('dd/ MM/ yyyy hh:mm')
                .format(widget.orderItem.dateTime)),
            trailing: IconButton(
                onPressed: () {
                  setState(() {
                    _expanded = !_expanded;
                  });
                },
                icon: const Icon(Icons.expand_more)),
          ),
          _expanded
              ? Container(
                  margin: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 1.0),
                  height: min(
                      widget.orderItem.products.length *
                          MediaQuery.of(context).size.height *
                          0.05,
                      MediaQuery.of(context).size.height * 0.3),
                  width: double.infinity,
                  child: ListView(
                    children: widget.orderItem.products
                        .map((cartItem) => Card(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    cartItem.title,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                      '${cartItem.quantity}x ${cartItem.price}')
                                ],
                              ),
                            ))
                        .toList(),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
