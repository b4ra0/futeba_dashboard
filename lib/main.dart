import 'package:flutter/material.dart';
import 'package:futeba/rotas.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = iniciarRotas();
    return MaterialApp.router(
      routerConfig: router,
      theme: ThemeData.dark(),
    );
  }
}

