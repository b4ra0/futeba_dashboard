import 'package:flutter/material.dart';
import 'package:futeba/screens/clubes/componentes/formulario_clube.dart';

class CadastrarClube extends StatelessWidget {
  const CadastrarClube({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar clube'),
      ),
      body: FormularioClube()
    );
  }
}
