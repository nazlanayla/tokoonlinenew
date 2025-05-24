import 'package:flutter/material.dart';
import 'package:tokoonline/users/beranda.dart';
import 'package:tokoonline/users/favoritepage.dart';
import 'package:tokoonline/users/keranjangpage.dart';
import 'package:tokoonline/users/transaksipage.dart';
import 'package:tokoonline/users/akunpage.dart';

class Landingpage extends StatefulWidget {
  const Landingpage({super.key});

  @override
  State<Landingpage> createState() => _LandingPageState();
}

class _LandingPageState extends State<Landingpage> {
  int _selectedIndex = 0;

  final List<Product> _cartProducts = [];

  void _addToCart(Product product) {
    setState(() {
      _cartProducts.add(product);
    });
  }

  List<Widget> get _pages => [
        Beranda(
          onAddToCart: _addToCart,
        ),
        const FavoritePage(),
        KeranjangPage(cartProducts: _cartProducts),
        const TransaksiPage(),
        const AkunPage(),
      ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Keranjang'),
          BottomNavigationBarItem(
              icon: Icon(Icons.receipt), label: 'Transaksi'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Akun'),
        ],
      ),
    );
  }
}
