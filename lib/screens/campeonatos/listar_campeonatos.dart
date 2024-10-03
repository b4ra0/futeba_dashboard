import 'package:flutter/material.dart';
import 'package:futeba/screens/campeonatos/componentes/tabela_de_campeonatos.dart';
import 'package:go_router/go_router.dart';

class ListarCampeonatos extends StatelessWidget {
  const ListarCampeonatos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de campeonatos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              context.push('/campeonatos/cadastrar');
            },
          )
        ],
      ),
      body: TabelaDeCampeonatos(),
    );
  }
}