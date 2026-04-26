import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5E6CA),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Registro", style: TextStyle(fontSize: 28)),

            const SizedBox(height: 20),

            TextField(
              decoration: InputDecoration(
                hintText: "Nombre",
                filled: true,
                fillColor: Colors.white,
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              decoration: InputDecoration(
                hintText: "Correo",
                filled: true,
                fillColor: Colors.white,
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Contraseña",
                filled: true,
                fillColor: Colors.white,
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/');
              },
              child: const Text("Crear cuenta"),
            ),
          ],
        ),
      ),
    );
  }
}
