import 'package:flutter/material.dart';
import 'package:mytech1/widgets/app_drawer.dart';
import 'package:mytech1/widgets/order_item.dart';
import 'package:provider/provider.dart';

import '../providers/orders.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/orderScreen';
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('Your Orders'),
      ),
      body: ListView.builder(
        reverse: true,
        itemBuilder: (context, index) =>
            OrderItems(orderItem: orderData.orders[index]),
        itemCount: orderData.orders.length,
        shrinkWrap: true,
      ),
    );
  }
}
