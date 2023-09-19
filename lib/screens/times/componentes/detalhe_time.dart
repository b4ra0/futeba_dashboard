import 'package:flutter/material.dart';
import 'package:futeba/models/time.dart';
import 'package:futeba/service/time_service.dart';
import 'package:go_router/go_router.dart';

class DetalheTime extends StatelessWidget {
  final Time time;
  const DetalheTime({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    TimeService timeService = TimeService();
    return Scaffold(
      appBar: AppBar(
        title: Text(time.nome),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              context.push('/times/editar/${time.id}');
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () async {
              await timeService.remover(time);
              context.pop();
            },
          ),
        ],
      ),
      body: Row(
        children: [
          Image.network(time.urlBrasao),
          Column(
            children: [
              Text(time.nome),
            ],
          ),
        ],
      ),
    );
  }
}
