import 'dart:io';
import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:permission_handler/permission_handler.dart';
import 'package:tokoonline/users/keranjangpage.dart';

class Product {
  final String name;
  final String price;
  final String description;

  Product({
    required this.name,
    required this.price,
    required this.description,
  });
}

class Beranda extends StatefulWidget {
  final Function(Product) onAddToCart;

  const Beranda({super.key, required this.onAddToCart});

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<Product> _products = [];
  final List<Product> _favoriteProducts = [];
  final List<Product> _cartProducts = [];

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  // File? _pickedImage;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  // Future<void> _pickImage() async {
  //   final picker = ImagePicker();
  //   bool permissionGranted = false;

  //   if (Platform.isAndroid) {
  //     if (await Permission.photos.request().isGranted ||
  //         await Permission.storage.request().isGranted) {
  //       permissionGranted = true;
  //     }
  //   } else if (Platform.isIOS) {
  //     if (await Permission.photos.request().isGranted) {
  //       permissionGranted = true;
  //     }
  //   }

  //   if (permissionGranted) {
  //     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  //     if (pickedFile != null) {
  //       setState(() {
  //         _pickedImage = File(pickedFile.path);
  //       });
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text('Tidak ada gambar yang dipilih')),
  //       );
  //     }
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Izin akses galeri ditolak')),
  //     );
  //   }
  // }

  void _addProduct() {
    final String name = _nameController.text;
    final String price = _priceController.text;
    final String description = _descriptionController.text;

    if (name.isNotEmpty && price.isNotEmpty && description.isNotEmpty) {
      setState(() {
        _products.add(Product(
          name: name,
          price: price,
          description: description,
        ));
        _nameController.clear();
        _priceController.clear();
        _descriptionController.clear();
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('$name ditambahkan ke produk')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Lengkapi semua data produk dan pilih gambar')),
      );
    }
  }

  void _addToFavorite(Product product) {
    setState(() {
      _favoriteProducts.add(product);
    });
  }

  void _addToCart(Product product) {
    widget.onAddToCart(product);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${product.name} ditambahkan ke keranjang')),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('nbeauty'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => KeranjangPage(cartProducts: _cartProducts),
                ),
              );
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Tambah Produk'),
            Tab(text: 'Produk Tersedia'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(labelText: 'Nama Produk'),
                  ),
                  TextField(
                    controller: _priceController,
                    decoration: InputDecoration(labelText: 'Harga Produk'),
                    keyboardType: TextInputType.number,
                  ),
                  TextField(
                    controller: _descriptionController,
                    decoration: InputDecoration(labelText: 'Deskripsi Produk'),
                  ),
                  SizedBox(height: 10),
                  //
                  // ElevatedButton.icon(
                  //   onPressed: _pickImage,
                  //   icon: Icon(Icons.image),
                  //   label: Text('Tambahkan Gambar'),
                  // ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _addProduct,
                    child: Text('Tambah Produk'),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: _products.length,
              itemBuilder: (context, index) {
                final product = _products[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    // leading: Image.file(
                    //   File(product.imagePath),
                    //   width: 50,
                    //   height: 50,
                    //   fit: BoxFit.cover,
                    //   errorBuilder: (context, error, stackTrace) =>
                    //       Icon(Icons.broken_image),
                    // ),
                    title: Text(product.name),
                    subtitle:
                        Text('Rp${product.price}\n${product.description}'),
                    isThreeLine: true,
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.favorite),
                          onPressed: () => _addToFavorite(product),
                        ),
                        IconButton(
                          icon: Icon(Icons.shopping_cart),
                          onPressed: () => _addToCart(product),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
