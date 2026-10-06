import 'package:flutter/material.dart';

import 'screens/pagina_bienvenida.dart';

void main() {
  runApp(const AdminProApp());
}

class AdminProApp extends StatelessWidget {
  const AdminProApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ADMICLINICA',
      theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Arial'),
      home: const PaginaBienvenida(),
    );
  }
}
