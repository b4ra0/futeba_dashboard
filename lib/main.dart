import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:futeba/helpers/api_client.dart';
import 'package:futeba/helpers/injector.dart';
import 'package:futeba/rotas.dart';
import 'package:window_manager/window_manager.dart';

Future<void> main() async {
  Injector.setup();
  await dotenv.load(fileName: ".env");
  await WindowManager.instance.maximize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = iniciarRotas();
    return MaterialApp.router(
      routerConfig: router,
      theme: ThemeData.dark(),
    );
  }
}

