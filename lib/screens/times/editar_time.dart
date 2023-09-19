import 'package:flutter/material.dart';
import 'package:futeba/screens/times/componentes/formulario_time.dart';
import 'package:futeba/service/time_service.dart';

class EditarTime extends StatelessWidget {
  final int id;
  const EditarTime({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    TimeService timeService = TimeService();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar time'),
      ),
      body: FutureBuilder(
        future: timeService.buscar(id),
        builder: (context, snapshot) {
          if(snapshot.hasData == false) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return FormularioTime(
            time: snapshot.data,
          );
        }
      ),
    );
  }
}
