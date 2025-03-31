import 'package:futeba/screens/campeonatos/listar_campeonatos.dart';
import 'package:futeba/screens/inicio.dart';
import 'package:futeba/screens/clubes/cadastrar_clube.dart';
import 'package:futeba/screens/clubes/editar_clube.dart';
import 'package:futeba/screens/clubes/listar_clubes.dart';
import 'package:futeba/screens/clubes/visualizar_clube.dart';
import 'package:go_router/go_router.dart';

iniciarRotas() => GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => Inicio(),
        ),
        GoRoute(
          path: '/clubes',
          builder: (context, state) => const ListaDeClubes(),
          routes: [
            GoRoute(
              path: 'visualizar/:id',
              builder: (context, state) => VisualizarClube(
                id: int.parse(state.pathParameters['id']!),
              ),
            ),
            GoRoute(
              path: 'cadastrar',
              builder: (context, state) => CadastrarClube(),
            ),
            GoRoute(
              path: 'editar/:id',
              builder: (context, state) => EditarClube(
                id: int.parse(state.pathParameters['id']!),
              ),
            ),
          ],
        ),
        GoRoute(
          path: '/campeonatos',
          builder: (context, state) => const ListarCampeonatos(),
        ),
      ],
    );
