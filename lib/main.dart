import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:flutter_application_1/screens/registro_screen.dart';
import 'package:flutter_application_1/screens/dietas_screen.dart';
import 'package:flutter_application_1/screens/calculadora_screen.dart';
import 'package:flutter_application_1/screens/consejos_screen.dart';
import 'package:flutter_application_1/widgets/bottom_nav.dart';

void main() => runApp(const FoodTrakApp());

class FoodTrakApp extends StatelessWidget {
  const FoodTrakApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FoodTrak',
      theme: ThemeData(primarySwatch: Colors.green, useMaterial3: true),
      // --- AGREGAMOS ESTO PARA QUE LOS BOTONES FUNCIONEN ---
      routes: {
        '/registro': (context) => const RegistroScreen(),
        '/calculadora': (context) => const CalculadoraScreen(),
        '/dietas': (context) => const DietasScreen(),
        '/consejos': (context) => const ConsejosScreen(),
      },
      // ----------------------------------------------------
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

  final List<Widget> _pantallas = [
    const HomeScreen(),
    const RegistroScreen(),
    const CalculadoraScreen(),
    const DietasScreen(),
    const ConsejosScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // IndexedStack es perfecto para no perder lo que el usuario escribe
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
