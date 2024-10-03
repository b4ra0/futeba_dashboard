import 'package:flutter/material.dart';
import 'package:futeba/models/campeonato.dart';
import 'package:futeba/models/time.dart';
import 'package:futeba/service/campeonato_service.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class TabelaDeCampeonatos extends StatefulWidget {
  const TabelaDeCampeonatos({super.key});

  @override
  State<TabelaDeCampeonatos> createState() => _TabelaDeCampeonatosState();
}

class _TabelaDeCampeonatosState extends State<TabelaDeCampeonatos> {
  CampeonatoService campeonatoService = CampeonatoService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: campeonatoService.listar(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
          case ConnectionState.active:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case ConnectionState.done:
            if (snapshot.hasError) {
              print(snapshot.error);
              return const Center(
                child: Text('Erro ao carregar os campeonatos'),
              );
            }
            List<Campeonato>? campeonatos = snapshot.data;
            return SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: DataTable(
                showBottomBorder: true,
                dataRowHeight: 100,
                columns: const [
                  DataColumn(
                    label: Text(''),
                  ),
                  DataColumn(
                    label: Text('Nome'),
                  ),
                  DataColumn(
                    label: Text('Data de início'),
                  ),
                  DataColumn(
                    label: Text('Nome'),
                  ),
                ],
                rows: campeonatos!
                    .map(
                      (campeonato) => DataRow(
                    key: ValueKey(campeonato.id),
                    cells: [
                      DataCell(
                        IconButton(
                          onPressed: () =>
                              context.push('/campeonatos/visualizar/${campeonato.id}'),
                          icon: const Icon(Icons.search),
                        ),
                      ),
                      DataCell(
                        Text(campeonato.nome)
                      ),
                      DataCell(
                        Text(campeonato.edicoes.first.campeao!.nome),
                      ),
                    ],
                  ),
                )
                    .toList(),
              ),
            );
        }
      },
    );
  }
}
