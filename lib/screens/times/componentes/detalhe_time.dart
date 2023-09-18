import 'package:flutter/material.dart';
import 'package:futeba/models/time.dart';

class DetalheTime extends StatelessWidget {
  final Time time;
  const DetalheTime({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(time.nome),
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
