import 'package:flutter/material.dart';

class RegistroScreen extends StatefulWidget {
  const RegistroScreen({super.key});

  @override
  State<RegistroScreen> createState() => _RegistroScreenState();
}

class _RegistroScreenState extends State<RegistroScreen> {
  int calorias = 0;

  final TextEditingController comidaController = TextEditingController();
  final TextEditingController caloriasController = TextEditingController();

  void agregarComida() {
    setState(() {
      calorias += int.tryParse(caloriasController.text) ?? 0;
    });

    comidaController.clear();
    caloriasController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Registro de comidas")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: comidaController,
              decoration: const InputDecoration(labelText: "Comida"),
            ),
            TextField(
              controller: caloriasController,
              decoration: const InputDecoration(labelText: "Calorías"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: agregarComida,
              child: const Text("Agregar"),
            ),
            const SizedBox(height: 20),
            Text("Total calorías: $calorias"),
          ],
        ),
      ),
    );
  }
}
