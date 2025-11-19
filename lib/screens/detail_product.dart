import 'package:flutter/material.dart';
import 'package:anything_footballshop/models/products.dart';

class DetailProductPage extends StatelessWidget {
  final Product product;

  const DetailProductPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (product.fields.thumbnail.isNotEmpty)
              Center(
                child: Image.network(
                  product.fields.thumbnail,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.image_not_supported, size: 100),
                ),
              ),
            const SizedBox(height: 20),
            Text(
              product.fields.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text("Price: Rp ${product.fields.price}", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text("Category: ${product.fields.category}", style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            Text("Stock: ${product.fields.isFeatured ? 'Featured' : 'Standard'}", style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            const Text("Description:", style: TextStyle(fontWeight: FontWeight.bold)),
            Text(product.fields.description),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Back to List"),
            ),
          ],
        ),
      ),
    );
  }
}