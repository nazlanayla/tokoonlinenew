import 'package:flutter/material.dart';
import 'package:tokoonline/helpers/local_storage.dart';

class AkunPage extends StatefulWidget {
  const AkunPage({super.key});

  @override
  State<AkunPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AkunPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    _nameController.text = await LocalStorage.getString('name') ?? '';
    _emailController.text = await LocalStorage.getString('email') ?? '';
    _phoneController.text = await LocalStorage.getString('phone') ?? '';
  }

  Future<void> _saveUserData() async {
    await LocalStorage.saveString('name', _nameController.text);
    await LocalStorage.saveString('email', _emailController.text);
    await LocalStorage.saveString('phone', _phoneController.text);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Biodata berhasil disimpan')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Akun Saya')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Nama Lengkap'),
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(labelText: 'Nomor Telepon'),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveUserData,
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
