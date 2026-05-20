import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/screens/login_screen.dart';
import 'package:flutter_application_1/screens/register_screen.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:flutter_application_1/screens/registro_screen.dart';
import 'package:flutter_application_1/screens/dietas_screen.dart';
import 'package:flutter_application_1/screens/calculadora_screen.dart';
import 'package:flutter_application_1/screens/consejos_screen.dart';
import 'package:flutter_application_1/widgets/bottom_nav.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp();
    print("¡Conexión a Firebase exitosa!");
  } catch (e) {
    print("Error conectando a Firebase: $e");
  }

  runApp(const FoodTrakApp());
}

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

      home: const LoginScreen(),

      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const MainWrapper(),
      },
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

  double metaCalorica = 2000.0;
  double caloriasConsumidas = 0.0;
  double proteinas = 0.0;
  double carbohidratos = 0.0;
  double grasas = 0.0;

  void actualizarMeta(double nuevaMeta) {
    setState(() {
      metaCalorica = nuevaMeta;
    });
  }

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
    return Scaffold(
      body: IndexedStack(
        index: _indiceActual,
        children: [
          HomeScreen(
            metaCalorica: metaCalorica,
            caloriasConsumidas: caloriasConsumidas,
            p: proteinas,
            c: carbohidratos,
            g: grasas,
            onTabRequested: (index) {
              setState(() {
                _indiceActual = index;
              });
            },
          ),
          RegistroScreen(onAlimentoAgregado: agregarCalorias),
          CalculadoraScreen(onMetaCalculada: actualizarMeta),
          const DietasScreen(),
          const ConsejosScreen(),
        ],
      ),

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
