import 'package:flutter/material.dart';

class CalculadoraScreen extends StatefulWidget {
  const CalculadoraScreen({super.key});

  @override
  State<CalculadoraScreen> createState() => _CalculadoraScreenState();
}

class _CalculadoraScreenState extends State<CalculadoraScreen> {
  String resultado = "";

  final TextEditingController peso = TextEditingController();
  final TextEditingController altura = TextEditingController();

  void calcular() {
    double p = double.tryParse(peso.text) ?? 0;
    double a = double.tryParse(altura.text) ?? 0;

    double imc = p / (a * a);

    setState(() {
      resultado = "IMC: ${imc.toStringAsFixed(2)}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calculadora")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: peso,
              decoration: const InputDecoration(labelText: "Peso (kg)"),
            ),
            TextField(
              controller: altura,
              decoration: const InputDecoration(labelText: "Altura (m)"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: calcular, child: const Text("Calcular")),
            const SizedBox(height: 20),
            Text(resultado),
          ],
        ),
      ),
    );
  }
}
