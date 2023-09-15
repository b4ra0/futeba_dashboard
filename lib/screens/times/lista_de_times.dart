import 'package:flutter/material.dart';
import 'package:futeba/models/time.dart';
import 'package:futeba/screens/times/componentes/tabela_de_times.dart';

class ListaDeTimes extends StatelessWidget {
  const ListaDeTimes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabelaDeTimes(),
    );
  }
}
