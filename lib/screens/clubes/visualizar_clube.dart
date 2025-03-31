import 'package:flutter/material.dart';
import 'package:futeba/screens/clubes/componentes/detalhe_clube.dart';
import 'package:futeba/service/clube_service.dart';

class VisualizarClube extends StatelessWidget {
  final int id;
  const VisualizarClube({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    ClubeService clubeService = ClubeService();
    return FutureBuilder(
      future: clubeService.buscar(id),
      builder: (context, snapshot) {
        if(snapshot.data == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return DetalheClube(clube: snapshot.data!);
      },
    );
  }
}
