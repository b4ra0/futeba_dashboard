import 'package:flutter/material.dart';
import 'package:futeba/screens/clubes/componentes/formulario_clube.dart';
import 'package:futeba/service/clube_service.dart';

class EditarClube extends StatelessWidget {
  final int id;
  const EditarClube({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    ClubeService clubeService = ClubeService();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar clube'),
      ),
      body: FutureBuilder(
        future: clubeService.buscar(id),
        builder: (context, snapshot) {
          if(snapshot.hasData == false) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return FormularioClube(
            clube: snapshot.data,
          );
        }
      ),
    );
  }
}
