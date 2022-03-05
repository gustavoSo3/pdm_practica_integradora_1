import 'package:flutter/material.dart';
import 'package:practica_integradora_1/providers/main_provider.dart';
import 'package:provider/provider.dart';

import 'main_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'La frase diaria',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: ChangeNotifierProvider<MainProvider>(
          create: (context) => MainProvider(),
          child: MainView(),
        ));
  }
}
