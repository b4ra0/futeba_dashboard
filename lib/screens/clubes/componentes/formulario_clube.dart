import 'package:flutter/material.dart';
import 'package:futeba/models/clube.dart';
import 'package:futeba/service/clube_service.dart';
import 'package:go_router/go_router.dart';

class FormularioClube extends StatefulWidget {
  final Clube? clube;

  get editando => clube != null;

  const FormularioClube({super.key, this.clube});

  @override
  State<FormularioClube> createState() => _FormularioClubeState();
}

class _FormularioClubeState extends State<FormularioClube> {
  final clubeService = ClubeService();
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nomeController;
  late final TextEditingController _brasaoController;
  DateTime? dataFundacao;

  @override
  void initState() {
    super.initState();
    _nomeController = TextEditingController(text: widget.clube?.nome);
    _brasaoController = TextEditingController(text: widget.clube?.urlBrasao);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            validator: (text) => text!.isEmpty ? 'Campo obrigatório' : null,
            controller: _nomeController,
            decoration: const InputDecoration(
              labelText: 'Nome',
            ),
          ),
          TextFormField(
            validator: (text) => text!.isEmpty ? 'Campo obrigatório' : null,
            controller: _brasaoController,
            decoration: const InputDecoration(
              labelText: 'Brasão',
            ),
          ),
          TextButton(
            onPressed: () async {
              dataFundacao = await showDatePicker(
                initialDate: dataFundacao,
                context: context,
                firstDate: DateTime(1850),
                lastDate: DateTime(DateTime.now().year, 12, 31),
              );
            },
            child: Text("Escoler data de fundação"),
          ),
          ElevatedButton(
            onPressed: () {
              if(_formKey.currentState!.validate() && dataFundacao != null) {
                widget.editando ? clubeService.atualizar(
                  widget.clube!,
                  {
                    'nome': _nomeController.text,
                    'url_brasao': _brasaoController.text,
                    'fundacao': dataFundacao,
                  },
                ) :
                clubeService.cadastrar(
                  {
                    'nome': _nomeController.text,
                    'url_brasao': _brasaoController.text,
                    'fundacao': dataFundacao!.toIso8601String(),
                  },
                );
                context.pop();
              }
            },
            child: const Text('Salvar'),
          ),
        ],
      ),
    );
  }
}
