import 'package:flutter/material.dart';
import 'package:futeba/models/clube.dart';
import 'package:futeba/service/clube_service.dart';
import 'package:go_router/go_router.dart';

class DetalheClube extends StatelessWidget {
  final Clube clube;
  const DetalheClube({super.key, required this.clube});

  @override
  Widget build(BuildContext context) {
    ClubeService clubeService = ClubeService();
    return Scaffold(
      appBar: AppBar(
        title: Text(clube.nome),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              context.push('/clubes/editar/${clube.id}');
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () async {
              await clubeService.remover(clube);
              context.pop();
            },
          ),
        ],
      ),
      body: Row(
        children: [
          Image.network(clube.urlBrasao??''),
          Column(
            children: [
              Text(clube.nome),
            ],
          ),
        ],
      ),
    );
  }
}
