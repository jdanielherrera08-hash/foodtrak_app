import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String fecha = DateFormat('dd/MM/yyyy').format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        title: const Text("FoodTrak"),
        backgroundColor: const Color(0xFF6FBF73),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color(0xFFF5E6CA),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  const Text("Bienvenido a FoodTrak"),
                  Text("Fecha: $fecha"),
                ],
              ),
            ),

            const SizedBox(height: 20),

            const Text("Calorías consumidas: 1200"),
            const Text("Meta diaria: 2000"),

            const SizedBox(height: 20),

            LinearProgressIndicator(
              value: 0.6,
              backgroundColor: Colors.grey[300],
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
