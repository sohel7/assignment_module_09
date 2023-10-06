
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class BlogScreen extends StatefulWidget {
  @override
  _BlogScreenState createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  List<ProductItem> products = [
    ProductItem(
      productName: 'Scut' ,
      productImage: 'https://png.pngtree.com/element_our/20190529/ourmid/pngtree-beautiful-red-tube-top-dress-image_1217088.jpg', // Image URL
      productPrice: 15.99,
    ),
    ProductItem(
      productName: 'Frog',
      productImage: 'https://png.pngtree.com/element_our/20190529/ourmid/pngtree-beautiful-red-tube-top-dress-image_1217088.jpg', // Replace with your image URL
      productPrice: 12.49,
    ),
    ProductItem(
      productName: 'Lahenga',
      productImage: 'https://png.pngtree.com/element_our/20190529/ourmid/pngtree-beautiful-red-tube-top-dress-image_1217088.jpg', // Replace with your image URL
      productPrice: 20.00,
    ),
    ProductItem(
      productName: 'Camiz',
      productImage:'https://png.pngtree.com/element_our/20190529/ourmid/pngtree-beautiful-red-tube-top-dress-image_1217088.jpg', // Image URL
      productPrice: 15.99,
    ),
    ProductItem(
      productName: 'Frog',
      productImage: 'https://png.pngtree.com/element_our/20190529/ourmid/pngtree-beautiful-red-tube-top-dress-image_1217088.jpg', // Replace with your image URL
      productPrice: 12.49,
    ),
    ProductItem(
      productName: 'Camiz',
      productImage: 'https://png.pngtree.com/element_our/20190529/ourmid/pngtree-beautiful-red-tube-top-dress-image_1217088.jpg', // Replace with your image URL
      productPrice: 20.00,
    ),

    // Add more ProductItem widgets for additional products
  ];

  double TotalAmount() {
    setState(() {

    });
    double total = 0;
    for (var product in products) {
      total += product.productPrice * product.quantity;
    }
    return total;
  }

  void showCongratulationsSnackbar(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('Congratulations! Your order has been placed.'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Blog'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Implement search functionality here
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Featured Products',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Column(
              children: products,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Total Amount: \$${TotalAmount().toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    showCongratulationsSnackbar(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red, // Change button color to red
                  ),
                  child: Text('CHECKOUT'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class ProductItem extends StatefulWidget {
  final String productName;
  final String productImage;
  final double productPrice;
  int quantity = 1; // Set a default quantity of 1

  ProductItem({
    required this.productName,
    required this.productImage,
    required this.productPrice,
  });

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  void increaseQuantity() {
    setState(() {
      widget.quantity++;
    });
  }

  void decreaseQuantity() {
    if (widget.quantity > 1) {
      setState(() {
        widget.quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        widget.productImage,
        width: 80,
        height: 80,
        fit: BoxFit.cover,
      ),
      title: Text(widget.productName),
      subtitle: Row(
        children: [
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: () {
              decreaseQuantity();
            },
          ),
          Text('${widget.quantity}'),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              increaseQuantity();
            },
          ),
          Spacer(),
          Text('\$${(widget.productPrice * widget.quantity).toStringAsFixed(2)}'),
        ],
      ),
    );
  }
}

