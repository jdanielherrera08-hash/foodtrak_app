import 'package:flutter/material.dart';

class ConsejosScreen extends StatelessWidget {
  const ConsejosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Consejos")),
      body: ListView(
        children: const [
          ListTile(title: Text("Bebe suficiente agua")),
          ListTile(title: Text("Evita comida procesada")),
          ListTile(title: Text("Haz ejercicio regularmente")),
        ],
      ),
    );
  }
}
