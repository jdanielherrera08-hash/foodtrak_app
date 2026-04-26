import 'package:flutter/material.dart';

class DietasScreen extends StatelessWidget {
  const DietasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dietas")),
      body: ListView(
        children: const [
          ListTile(
            title: Text("Dieta baja en calorías"),
            subtitle: Text("Ideal para perder peso"),
          ),
          ListTile(
            title: Text("Dieta alta en proteínas"),
            subtitle: Text("Para ganar masa muscular"),
          ),
        ],
      ),
    );
  }
}
