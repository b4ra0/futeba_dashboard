import 'package:flutter/material.dart';
import 'package:futeba/rotas.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final _router = iniciarRotas();
    return MaterialApp.router(
      routerConfig: _router,
      theme: ThemeData.dark(),
    );
  }
}

