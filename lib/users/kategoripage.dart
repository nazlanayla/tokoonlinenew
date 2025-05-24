import 'package:flutter/material.dart';

class Kategoripage extends StatefulWidget {
  @override
  _KategoriPageState createState() => _KategoriPageState();
}

class _KategoriPageState extends State<Kategoripage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kategori Page'),
      ),
      body: Center(
        child: Text('KategoriPage'),
      ),
    );
  }
}
