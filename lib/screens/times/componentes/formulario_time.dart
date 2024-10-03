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
  DateTime? dataFundacao;

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
                widget.editando ? timeService.atualizar(
                  widget.time!,
                  {
                    'nome': _nomeController.text,
                    'url_brasao': _brasaoController.text,
                    'fundacao': dataFundacao,
                  },
                ) :
                timeService.cadastrar(
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
