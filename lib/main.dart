import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:anything_footballshop/screens/login.dart'; // Ubah import home ke login

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'Anything FootballShop',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 28, 212, 68)).copyWith(secondary: Colors.blueAccent[400]),
          useMaterial3: true,
        ),
        home: const LoginPage(), // Set home awal ke LoginPage
      ),
    );
  }
}