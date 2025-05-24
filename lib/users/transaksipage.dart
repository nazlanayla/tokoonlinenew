import 'package:flutter/material.dart';

class TransaksiPage extends StatelessWidget {
  const TransaksiPage({super.key}); // Tambahkan const constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('nbeauty'), // Gunakan const di sini
      ),
      body: const Center(
          child: Text('TransaksiPage')), // Gunakan const di sini juga
    );
  }
}
