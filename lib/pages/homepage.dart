import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../models/product_model.dart';
import 'product_details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Sample product data
  final List<Product> products = [
    Product(
      name: 'Product 1',
      imageUrl: 'https://via.placeholder.com/150', 
    ),
    Product(
      name: 'Product 2',
      imageUrl: 'https://via.placeholder.com/150', 
    ),
    // Add more products as needed
  ];
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text('Product Variants'),
      ),
      body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Image.network(
                products[index].imageUrl,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(products[index].name),
              onTap: () {
                // Handle product selection
                _navigateToProductDetails(context, products[index]);
              },
            );
          },
        ),
      );
    
  }

  void _navigateToProductDetails(BuildContext context, Product product) {
     Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ProductDetailsPage(product: product)),
  );
    if (kDebugMode) {
      print('Selected product: ${product.name}');
    }
  }
    
  
  
}