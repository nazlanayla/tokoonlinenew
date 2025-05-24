import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tokoonline/users/beranda.dart';

class KeranjangPage extends StatelessWidget {
  final List<Product> cartProducts;

  const KeranjangPage({super.key, required this.cartProducts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Keranjang Belanja')),
      body: cartProducts.isEmpty
          ? const Center(child: Text('Keranjang kosong'))
          : ListView.builder(
              itemCount: cartProducts.length,
              itemBuilder: (context, index) {
                final product = cartProducts[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    // leading: Image.file(
                    //   File(product.imagePath),
                    //   width: 50,
                    //   height: 50,
                    //   fit: BoxFit.cover,
                    //   errorBuilder: (context, error, stackTrace) =>
                    //       const Icon(Icons.broken_image),
                    // ),
                    title: Text(product.name),
                    subtitle:
                        Text('Rp${product.price}\n${product.description}'),
                    isThreeLine: true,
                  ),
                );
              },
            ),
    );
  }
}
