import 'package:flutter/material.dart';
import 'package:futeba/screens/times/componentes/detalhe_time.dart';
import 'package:futeba/service/time_service.dart';

class VisualizarTime extends StatelessWidget {
  final int id;
  const VisualizarTime({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    TimeService timeService = TimeService();
    return FutureBuilder(
      future: timeService.buscar(id),
      builder: (context, snapshot) {
        if(snapshot.data == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return DetalheTime(time: snapshot.data!);
      },
    );
  }
}
