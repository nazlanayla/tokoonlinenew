import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tokoonline/constans.dart';
import 'package:tokoonline/users/landingpage.dart';
import 'package:tokoonline/helpers/local_storage.dart';
import 'package:tokoonline/loginpage.dart';

class LauncherPage extends StatefulWidget {
  const LauncherPage({super.key});

  @override
  State<LauncherPage> createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () async {
      final username = await LocalStorage.getUsername();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (_) =>
                username != null ? const Landingpage() : const LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Pallette.bg1, Pallette.bg2],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Image.asset('assets/images/logo.png', height: 200),
        ),
      ),
    );
  }
}
