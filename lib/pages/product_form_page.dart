import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/product_list.dart';

import '../models/product.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _imageUrlController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final Map<String, Object> _formData = {};

  @override
  void initState() {
    super.initState();
    _imageUrlController.addListener(_updateImageUrl);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_formData.isEmpty) {
      final arg = ModalRoute.of(context)?.settings.arguments;
      if (arg != null && arg is Product) {
        final product = arg;
        _formData['id'] = product.id;
        _formData['name'] = product.name;
        _formData['price'] = product.price;
        _formData['description'] = product.description;
        _formData['imageUrl'] = product.imageUrl;

        _imageUrlController.text = _formData['imageUrl'].toString();
      }
    }
  }

  @override
  void dispose() {
    _imageUrlController.removeListener(_updateImageUrl);
    _imageUrlController.dispose();
    super.dispose();
  }

  void _updateImageUrl() {
    setState(() {});
  }

  void clearForm() {
    _formKey.currentState?.reset();
    _imageUrlController.clear();
  }

  void submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();

      Provider.of<ProductList>(context, listen: false).saveProduct(_formData);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de Produto'),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
            onPressed: submitForm,
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              Column(
                children: [
                  TextFormField(
                    initialValue: _formData['name']?.toString(),
                    decoration: InputDecoration(
                      labelText: 'Nome',
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                    ),
                    textInputAction: TextInputAction.next,
                    onSaved: (name) => _formData['name'] = name.toString(),
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return 'Informe um nome válido!';
                      }
                      if (value.trim().length < 3) {
                        return 'Informe um nome com no mínimo 3 letras!';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    initialValue: _formData['price']?.toString(),
                    decoration: InputDecoration(
                      labelText: 'Preço',
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                    ),
                    textInputAction: TextInputAction.next,
                    onSaved: (price) =>
                        _formData['price'] = double.parse(price.toString()),
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return 'Informe um preço válido!';
                      }
                      if (double.tryParse(value) == null ||
                          double.parse(value) <= 0) {
                        return 'Informe um preço válido!';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                  ),
                  TextFormField(
                    initialValue: _formData['description']?.toString(),
                    decoration: InputDecoration(
                      labelText: 'Descrição',
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.multiline,
                    maxLines: 3,
                    onSaved: (description) =>
                        _formData['description'] = description.toString(),
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return 'Informe um nome válido!';
                      }
                      if (value.trim().length < 10) {
                        return 'Informe um nome com no mínimo 10 letras!';
                      }
                      return null;
                    },
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'URL da Imagem',
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.url,
                          textInputAction: TextInputAction.done,
                          controller: _imageUrlController,
                          onFieldSubmitted: (value) => submitForm(),
                          onSaved: (imageUrl) =>
                              _formData['imageUrl'] = imageUrl.toString(),
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return 'Informe uma URL válida!';
                            }
                            if (!value.trim().startsWith('http') &&
                                !value.trim().startsWith('https')) {
                              return 'Informe uma URL válida!';
                            }
                            if (!value.trim().endsWith('.png') &&
                                !value.trim().endsWith('.jpg') &&
                                !value.trim().endsWith('.jpeg')) {
                              return 'Informe uma URL válida!';
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 100,
                        margin: EdgeInsets.only(
                          top: 8,
                          left: 10,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: _imageUrlController.text.isEmpty
                            ? Text('Informe a URL!')
                            : Image.network(
                                _imageUrlController.text,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: submitForm,
                    child: Text('Salvar'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
