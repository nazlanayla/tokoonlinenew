import 'package:flutter/material.dart';

class Depanpage extends StatefulWidget {
  @override
  State<Depanpage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<Depanpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('nbeauty'),
      ),
      body: Center(child: Text('Depanpage')),
    );
  }
}
