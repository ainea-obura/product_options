
import 'package:flutter/material.dart';
import '../models/product_model.dart';

class ProductOption {
  String name;
  List<String> values;

  ProductOption({required this.name, required this.values});
}




class ProductDetailsPage extends StatefulWidget {
  final Product product;
  

  const ProductDetailsPage({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  List<ProductOption> options = []; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                widget.product.imageUrl,
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              const Text(
                'Enter options:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  _addOption(); // Function to add a new option
                },
                child: const Text('Add Option'),
              ),
              const SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                itemCount: options.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Option ${index + 1}'),
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Option Name'),
                        onChanged: (value) {
                          setState(() {
                            options[index].name = value;
                          });
                        },
                      ),
                      const SizedBox(height: 10),
                      _buildValuesInput(index),
                      const Divider(),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _saveOptions();
        },
        child: const Icon(Icons.save),
      ),
    );
  }

  Widget _buildValuesInput(int index) {
    if (options[index].values.isEmpty || options[index].values.last.isNotEmpty) {
      options[index].values.add(''); 
    }

    return Column(
      children: options[index].values.map<Widget>((value) {
        return TextFormField(
          decoration: const InputDecoration(labelText: 'Option Value'),
          onChanged: (newValue) {
            setState(() {
              options[index].values[options[index].values.indexOf(value)] = newValue;
            });
            if (newValue.isNotEmpty && value == options[index].values.last) {
              _addOption(); 
            }
          },
        );
      }).toList(),
    );
  }

  void _addOption() {
    setState(() {
      options.add(ProductOption(name: '', values: []));
    });
  }

  void _saveOptions() {
    print('Saved Options: $options');
  }
}


