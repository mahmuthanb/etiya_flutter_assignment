import 'package:etiya_flutter_assignment/controller/router/router.gr.dart';
import 'package:etiya_flutter_assignment/data/theme_data.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(EtiyaFlutterAssignment());
}

class EtiyaFlutterAssignment extends StatelessWidget {
  EtiyaFlutterAssignment({Key? key}) : super(key: key);

  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        title: 'ETIYA Flutter Assigment',
        theme: lightTheme,
        debugShowCheckedModeBanner: false,
        routeInformationParser: _appRouter.defaultRouteParser(),
        routerDelegate: _appRouter.delegate());
  }
}
