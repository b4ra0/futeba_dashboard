import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:futeba/screens/times/lista_de_times.dart';
import 'package:go_router/go_router.dart';

class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).push('/times');
              },
              child: const Text('Listar times'),
            ),
          ],
        ),
      )
    );
  }
}
