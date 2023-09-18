import 'package:flutter/material.dart';
import 'package:futeba/screens/times/componentes/tabela_de_times.dart';
import 'package:go_router/go_router.dart';

class ListaDeTimes extends StatelessWidget {
  const ListaDeTimes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de times'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              context.push('/times/cadastrar');
            },
          )
        ],
      ),
      body: TabelaDeTimes(),
    );
  }
}
