import 'package:flutter/material.dart';
import 'package:futeba/screens/times/componentes/formulario_time.dart';

class CadastrarTime extends StatelessWidget {
  const CadastrarTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar time'),
      ),
      body: FormularioTime()
    );
  }
}
