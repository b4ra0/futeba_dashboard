import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:futeba/screens/clubes/listar_clubes.dart';
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
                GoRouter.of(context).push('/clubes');
              },
              child: const Text('Listar clubes'),
            ),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).push('/campeonatos');
              },
              child: const Text('Listar campeonatos'),
            ),
          ],
        ),
      )
    );
  }
}
