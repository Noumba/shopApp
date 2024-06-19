import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mytech1/providers/product.dart';
import 'package:mytech1/providers/products_provider.dart';
import 'package:provider/provider.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/editProductScreen';

  const EditProductScreen({Key? key}) : super(key: key);

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();
  final _descriptionNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _imageUrlFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  var _init = true;
  var _isLoading = false;

  var _editedProduct = Product(
      id: DateFormat('yyyy/mm/dd mm:ss').format(DateTime.now()),
      title: '',
      description: '',
      price: 0,
      url: '');
  var _initValue = {
    'title': '',
    'description': '',
    'price': '',
    'imageUrl': ''
  };

  @override
  void initState() {
    _imageUrlFocusNode.addListener(() {
      _updateImageUrl();
    });

    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_init) {
      final prodId = ModalRoute.of(context)!.settings.arguments;
      if (prodId != null) {
        _editedProduct = Provider.of<Productsproviders>(context, listen: false)
            .findById(prodId as String);
        _initValue = {
          'title': _editedProduct.title,
          'description': _editedProduct.description,
          'price': _editedProduct.price.toString(),
          'imageUrl': ''
        };
        _imageUrlController.text = _editedProduct.url;
      }
    }
    _init = false;
    super.didChangeDependencies();
  }

  void _updateImageUrl() {
    if (!_imageUrlFocusNode.hasFocus) {
      setState(() {});
    }
  }

  void _saveForm() {
    _form.currentState!
        .validate(); //can store in a variable and check variable while doing auto update in TextFormFields
    _form.currentState!.save();
  }

  @override
  void dispose() {
    _priceFocusNode.dispose();
    _descriptionNode.dispose();
    _imageUrlController.dispose();
    _imageUrlFocusNode.dispose();
    _imageUrlFocusNode.removeListener(() {
      _updateImageUrl();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Product'),
        actions: [
          IconButton(
              onPressed: () async {
                _saveForm();
                setState(() {
                  _isLoading = true;
                });
                var index =
                    Provider.of<Productsproviders>(context, listen: false)
                        .seachProduct(_editedProduct.id);
                if (index >= 0) {
                  await Provider.of<Productsproviders>(context, listen: false)
                      .addEditedProduct(index, _editedProduct);
                  Navigator.pop(context);
                } else {
                  await Provider.of<Productsproviders>(context, listen: false)
                      .addProduct(_editedProduct)
                      .catchError((error) {
                    showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                              title: const Text("An Error Occured"),
                              content: Text(error.toString()),
                              actions: <Widget>[
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text("Okay"))
                              ],
                            ));
                  }).then((value) {
                    setState(() {
                      _isLoading = false;
                    });
                    Navigator.of(context).pop();
                  });
                }
              },
              icon: const Icon(Icons.save))
        ],
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                  key: _form,
                  child: ListView(
                    children: [
                      TextFormField(
                        initialValue: _initValue['title'],
                        autocorrect: true,
                        decoration: const InputDecoration(
                          labelText: 'Title',
                        ),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(_priceFocusNode);
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Title field is required';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _editedProduct = Product(
                              id: _editedProduct.id,
                              title: value as String,
                              description: _editedProduct.description,
                              price: _editedProduct.price,
                              url: _editedProduct.url,
                              isFavorite: _editedProduct.isFavorite);
                        },
                      ),
                      TextFormField(
                        initialValue: _initValue['price'],
                        autocorrect: true,
                        decoration: const InputDecoration(labelText: 'Price'),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        focusNode: _priceFocusNode,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(_descriptionNode);
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Price is required';
                          }
                          final price = num.tryParse(value);
                          if (price == null) {
                            return 'Please enter a valid price';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _editedProduct = Product(
                              id: _editedProduct.id,
                              title: _editedProduct.title,
                              description: _editedProduct.description,
                              price: double.parse(value as String),
                              url: _editedProduct.url,
                              isFavorite: _editedProduct.isFavorite);
                        },
                      ),
                      TextFormField(
                        initialValue: _initValue['description'],
                        autocorrect: true,
                        decoration:
                            const InputDecoration(labelText: 'Description'),
                        maxLines: 4,
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.next,
                        focusNode: _descriptionNode,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Description field is required';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _editedProduct = Product(
                              id: _editedProduct.id,
                              title: _editedProduct.title,
                              description: value as String,
                              price: _editedProduct.price,
                              url: _editedProduct.url,
                              isFavorite: _editedProduct.isFavorite);
                        },
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            margin: const EdgeInsets.only(top: 8.0, right: 10),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1,
                                    color: Colors.grey,
                                    style: BorderStyle.solid)),
                            child: _imageUrlController.text.isEmpty
                                ? const Text('Enter Image URL')
                                : FittedBox(
                                    fit: BoxFit.cover,
                                    child:
                                        Image.network(_imageUrlController.text),
                                  ),
                          ),
                          Expanded(
                            child: TextFormField(
                              focusNode: _imageUrlFocusNode,
                              decoration:
                                  const InputDecoration(labelText: 'Image URL'),
                              keyboardType: TextInputType.url,
                              textInputAction: TextInputAction.done,
                              controller: _imageUrlController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'URL field is required';
                                }
                                return null;
                              },
                              onEditingComplete: () {
                                setState(() {});
                              },
                              onFieldSubmitted: (_) {
                                _saveForm();
                              },
                              onSaved: (value) {
                                _editedProduct = Product(
                                    id: _editedProduct.id,
                                    title: _editedProduct.title,
                                    description: _editedProduct.description,
                                    price: _editedProduct.price,
                                    url: value as String,
                                    isFavorite: _editedProduct.isFavorite);
                              },
                            ),
                          )
                        ],
                      ),
                    ],
                  )),
            ),
    );
  }
}
