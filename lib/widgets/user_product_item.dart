import 'package:flutter/material.dart';
import 'package:mytech1/providers/products_provider.dart';
import 'package:mytech1/screens/edit_product_screen.dart';
import 'package:provider/provider.dart';

class UserProductItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String prodIdl;

  const UserProductItem(
      {Key? key,
      required this.title,
      required this.imageUrl,
      required this.prodIdl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: SizedBox(
        width: MediaQuery.of(context).size.width * 0.3,
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, EditProductScreen.routeName,
                      arguments: prodIdl);
                },
                icon: Icon(
                  Icons.edit,
                  color: Theme.of(context).primaryColor,
                )),
            IconButton(
                onPressed: () async {
                  try {
                    await Provider.of<Productsproviders>(context, listen: false)
                        .deleteProduct(prodIdl);
                  } catch (error) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Failed to Delete"),
                    ));
                  }
                },
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).colorScheme.secondary,
                ))
          ],
        ),
      ),
    );
  }
}
