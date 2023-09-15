import 'package:flutter/material.dart';
import 'package:futeba/models/time.dart';
import 'package:futeba/service/time_service.dart';

class TabelaDeTimes extends StatefulWidget {
  const TabelaDeTimes({super.key});

  @override
  State<TabelaDeTimes> createState() => _TabelaDeTimesState();
}

class _TabelaDeTimesState extends State<TabelaDeTimes> {
  TimeService timeService = TimeService();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
        future: timeService.listar(),
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
                return const Center(
                  child: Text('Erro ao carregar os times'),
                );
              }
              List<Time>? times = snapshot.data;
              return DataTable(
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
                rows: times!
                    .map(
                      (time) => DataRow(
                        key: ValueKey(time.id),
                        cells: [
                          DataCell(
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.search),
                            ),
                          ),
                          DataCell(
                            Image.network(
                              time.urlBrasao,
                              height: 150,
                              isAntiAlias: true,
                              filterQuality: FilterQuality.high,
                            ),
                          ),
                          DataCell(
                            Text(time.id.toString()),
                          ),
                          DataCell(
                            Text(time.nome),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              );
          }
        },
      ),
    );
  }
}
