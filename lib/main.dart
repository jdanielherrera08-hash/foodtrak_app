import 'package:flutter/material.dart';
// Importamos todas tus pantallas
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:flutter_application_1/screens/registro_screen.dart';
import 'package:flutter_application_1/screens/dietas_screen.dart';
import 'package:flutter_application_1/screens/calculadora_screen.dart';
import 'package:flutter_application_1/screens/consejos_screen.dart'; // Agregué esta
// Importamos el widget de la barra
import 'package:flutter_application_1/widgets/bottom_nav.dart';

void main() => runApp(const FoodTrakApp());

class FoodTrakApp extends StatelessWidget {
  const FoodTrakApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FoodTrak',
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: true, // Esto hace que se vea más moderno como tu Figma
      ),
      home: const MainWrapper(),
    );
  }
}

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int _indiceActual = 0;

  // IMPORTANTE: El orden de esta lista debe ser igual al del bottom_nav.dart
  final List<Widget> _pantallas = [
    const HomeScreen(), // 0
    const RegistroScreen(), // 1
    const CalculadoraScreen(), // 2
    const DietasScreen(), // 3
    const ConsejosScreen(), // 4
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Muestra la pantalla según el índice seleccionado
      body: IndexedStack(index: _indiceActual, children: _pantallas),
      bottomNavigationBar: BottomNav(
        currentIndex: _indiceActual,
        onTap: (index) {
          setState(() {
            _indiceActual = index;
          });
        },
      ),
    );
  }
}
