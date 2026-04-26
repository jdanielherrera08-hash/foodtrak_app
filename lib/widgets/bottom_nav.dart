import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  // Estos son los parámetros que faltaban y por eso daban error
  final int currentIndex;
  final Function(int) onTap;

  const BottomNav({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed, // Mantiene los 5 iconos fijos
      selectedItemColor: Colors.green[700],
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
        BottomNavigationBarItem(
          icon: Icon(Icons.assignment),
          label: 'Registro',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.calculate), label: 'IMC'),
        BottomNavigationBarItem(
          icon: Icon(Icons.restaurant_menu),
          label: 'Dietas',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.lightbulb), label: 'Consejos'),
      ],
    );
  }
}
