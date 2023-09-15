import 'package:futeba/screens/inicio.dart';
import 'package:futeba/screens/times/componentes/tabela_de_times.dart';
import 'package:futeba/screens/times/lista_de_times.dart';
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
    ),
  ],
);