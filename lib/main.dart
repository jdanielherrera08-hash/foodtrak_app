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
      theme: ThemeData(
        primaryColor: const Color(0xFF8A9A5B),
        useMaterial3: true,
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

  // --- VARIABLES DE ESTADO GLOBAL ---
  double metaCalorica = 2000.0; // Valor inicial por defecto
  double caloriasConsumidas = 0.0;

  // Para las gráficas de macros
  double proteinas = 0.0;
  double carbohidratos = 0.0;
  double grasas = 0.0;

  // --- FUNCIONES PARA ACTUALIZAR DATOS ---

  // Esta función la usará la Calculadora para cambiar la meta (Cuadro Verde)
  void actualizarMeta(double nuevaMeta) {
    setState(() {
      metaCalorica = nuevaMeta;
    });
  }

  // Esta función la usará el Registro para sumar calorías (Cuadro Rojo y Gráficas)
  void agregarCalorias(double kcal, double p, double c, double g) {
    setState(() {
      caloriasConsumidas += kcal;
      proteinas += p;
      carbohidratos += c;
      grasas += g;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Definimos las pantallas pasando los datos y las funciones de actualización
    final List<Widget> _pantallas = [
      HomeScreen(
        metaCalorica: metaCalorica,
        caloriasConsumidas: caloriasConsumidas,
        p: proteinas,
        c: carbohidratos,
        g: grasas,
        onTabRequested: (index) {
          setState(() => _indiceActual = index);
        },
      ),
      RegistroScreen(
        onAlimentoAgregado: agregarCalorias, // Pasamos la función al registro
      ),
      CalculadoraScreen(
        onMetaCalculada: actualizarMeta, // Pasamos la función a la calculadora
      ),
      const DietasScreen(),
      const ConsejosScreen(),
    ];

    return Scaffold(
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
