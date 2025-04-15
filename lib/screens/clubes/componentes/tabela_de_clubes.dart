import 'package:flutter/material.dart';
import 'package:futeba/models/clube.dart';
import 'package:futeba/service/clube_service.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class TabelaDeClubes extends StatefulWidget {
  const TabelaDeClubes({super.key});

  @override
  State<TabelaDeClubes> createState() => _TabelaDeClubesState();
}

class _TabelaDeClubesState extends State<TabelaDeClubes> {
  ClubeService clubeService = ClubeService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: clubeService.listar(),
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
                child: Text('Erro ao carregar os clubes'),
              );
            }
            List<Clube>? clubes = snapshot.data;
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
                    label: Text('Brasão'),
                  ),
                  DataColumn(
                    label: Text('Id'),
                  ),
                  DataColumn(
                    label: Text('Nome'),
                  ),
                ],
                rows: clubes!
                    .map(
                      (clube) => DataRow(
                        key: ValueKey(clube.id),
                        cells: [
                          DataCell(
                            IconButton(
                              onPressed: () =>
                                  context.push('/clubes/visualizar/${clube.id}'),
                              icon: const Icon(Icons.search),
                            ),
                          ),
                          DataCell(
                            Image.network(
                              ,
                              height: 150,
                              isAntiAlias: true,
                              filterQuality: FilterQuality.high,
                            ),
                          ),
                          DataCell(
                            Text(clube.nomeCompleto),
                          ),
                          DataCell(
                            Text(DateFormat('dd/MM/yyyy').format(clube.fundacao)),
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
