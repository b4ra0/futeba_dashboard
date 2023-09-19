import 'package:futeba/screens/inicio.dart';
import 'package:futeba/screens/times/cadastrar_time.dart';
import 'package:futeba/screens/times/componentes/tabela_de_times.dart';
import 'package:futeba/screens/times/editar_time.dart';
import 'package:futeba/screens/times/lista_de_times.dart';
import 'package:futeba/screens/times/visualizar_time.dart';
import 'package:go_router/go_router.dart';

iniciarRotas() => GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => Inicio(),
        ),
        GoRoute(
          path: '/times',
          builder: (context, state) => const ListaDeTimes(),
          routes: [
            GoRoute(
              path: 'visualizar/:id',
              builder: (context, state) => VisualizarTime(
                id: int.parse(state.pathParameters['id']!),
              ),
            ),
            GoRoute(
              path: 'cadastrar',
              builder: (context, state) => CadastrarTime(),
            ),
            GoRoute(
              path: 'editar/:id',
              builder: (context, state) => EditarTime(
                id: int.parse(state.pathParameters['id']!),
              ),
            ),
          ],
        ),
      ],
    );
