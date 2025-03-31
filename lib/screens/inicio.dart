import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:futeba/screens/clubes/listar_clubes.dart';
import 'package:go_router/go_router.dart';

class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FuteData'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Clubes'),
              onTap: () {
                GoRouter.of(context).push('/clubes');
              },
            ),
            ListTile(
              title: const Text('Campeonatos'),
              onTap: () {
                GoRouter.of(context).push('/campeonatos');
              },
            ),
          ],
        ),
      ),
      body: Container()
    );
  }
}
