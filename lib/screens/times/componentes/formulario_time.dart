import 'package:flutter/material.dart';
import 'package:futeba/models/time.dart';
import 'package:futeba/service/time_service.dart';
import 'package:go_router/go_router.dart';

class FormularioTime extends StatefulWidget {
  final Time? time;

  get editando => time != null;

  const FormularioTime({super.key, this.time});

  @override
  State<FormularioTime> createState() => _FormularioTimeState();
}

class _FormularioTimeState extends State<FormularioTime> {
  final timeService = TimeService();
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nomeController;
  late final TextEditingController _brasaoController;

  @override
  void initState() {
    super.initState();
    _nomeController = TextEditingController(text: widget.time?.nome);
    _brasaoController = TextEditingController(text: widget.time?.urlBrasao);
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
          ElevatedButton(
            onPressed: () {
              if(_formKey.currentState!.validate()) {
                widget.editando ? timeService.atualizar(
                  widget.time!,
                  {
                    'nome': _nomeController.text,
                    'url_brasao': _brasaoController.text,
                  },
                ) :
                timeService.cadastrar(
                  {
                    'nome': _nomeController.text,
                    'url_brasao': _brasaoController.text,
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
