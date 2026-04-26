import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/registro_screen.dart';
import '../screens/calculadora_screen.dart';
import '../screens/dietas_screen.dart';
import '../screens/consejos_screen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const RegistroScreen(),
    const CalculadoraScreen(),
    const DietasScreen(),
    const ConsejosScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            label: "Registro",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: "Calcular",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.food_bank), label: "Dietas"),
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb),
            label: "Consejos",
          ),
        ],
      ),
    );
  }
}
