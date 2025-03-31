import 'package:flutter/material.dart';
import 'package:futeba/screens/clubes/componentes/tabela_de_clubes.dart';
import 'package:go_router/go_router.dart';

class ListaDeClubes extends StatelessWidget {
  const ListaDeClubes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de clubes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              context.push('/clubes/cadastrar');
            },
          )
        ],
      ),
      body: TabelaDeClubes(),
    );
  }
}
