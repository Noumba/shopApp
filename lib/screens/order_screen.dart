import 'package:flutter/material.dart';
import 'package:mytech1/widgets/order_item.dart';
import 'package:provider/provider.dart';

import '../providers/orders.dart';

class OrderScreen extends StatefulWidget {
  static const routeName = '/orderScreen';
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen>
    with AutomaticKeepAliveClientMixin<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      //drawer: const AppDrawer(),
      body: ListView.builder(
        reverse: true,
        itemBuilder: (context, index) =>
            OrderItems(orderItem: orderData.orders[index]),
        itemCount: orderData.orders.length,
        shrinkWrap: true,
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
