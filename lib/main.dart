import 'package:flutter/material.dart';
import 'package:yandex_map_parking_layer_test/router/router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      builder: (_, router) {
        return router!;
      },
    );
  }
}
