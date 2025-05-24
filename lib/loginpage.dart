// lib/users/loginpage.dart
import 'package:flutter/material.dart';
import 'package:tokoonline/helpers/local_storage.dart';
import 'package:tokoonline/users/landingpage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key}); // <-- pastikan ada const constructor

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _controller = TextEditingController();

  Future<void> _login() async {
    final username = _controller.text.trim();
    if (username.isNotEmpty) {
      await LocalStorage.saveUsername(username);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const Landingpage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nama pengguna tidak boleh kosong')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: 'Nama Pengguna'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: const Text('Masuk'),
            ),
          ],
        ),
      ),
    );
  }
}
