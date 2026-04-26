import 'package:flutter/material.dart';

class ConsejosScreen extends StatefulWidget {
  const ConsejosScreen({super.key});

  @override
  State<ConsejosScreen> createState() => _ConsejosScreenState();
}

class _ConsejosScreenState extends State<ConsejosScreen> {
  // Variable para saber qué categoría está seleccionada
  String categoriaSeleccionada = "Nutrición";

  // Datos de los consejos basados en tus imágenes
  final Map<String, List<Map<String, String>>> datosConsejos = {
    "Nutrición": [
      {
        "titulo": "Variedad en el plato",
        "desc":
            "Consume frutas y verduras de distintos colores para obtener diferentes vitaminas.",
      },
      {
        "titulo": "Proteína magra",
        "desc":
            "Prioriza el consumo de pollo, pescado, legumbres y cortes magros de carne.",
      },
    ],
    "Hidratación": [
      {
        "titulo": "Agua es vida",
        "desc":
            "Bebe al menos 2 litros de agua al día, incluso si no tienes sed.",
      },
      {
        "titulo": "Evita azúcares",
        "desc":
            "Sustituye refrescos y jugos procesados por agua natural o infusiones.",
      },
    ],
    "Ejercicio": [
      {
        "titulo": "Consistencia",
        "desc":
            "Realiza al menos 30 minutos de actividad física moderada 5 veces por semana.",
      },
      {
        "titulo": "Fuerza y Cardio",
        "desc":
            "Combina ejercicios de resistencia muscular con caminatas o correr.",
      },
    ],
    "Salud Mental": [
      {
        "titulo": "Descanso reparador",
        "desc":
            "Duerme entre 7 y 8 horas para permitir que tu cuerpo y mente se recuperen.",
      },
      {
        "titulo": "Manejo del estrés",
        "desc":
            "Dedica 10 minutos al día a la meditación o respiración profunda.",
      },
    ],
    "Estilo de Vida": [
      {
        "titulo": "Menos pantallas",
        "desc":
            "Reduce el uso de dispositivos móviles una hora antes de dormir.",
      },
      {
        "titulo": "Cocina en casa",
        "desc":
            "Preparar tus alimentos te da control total sobre la sal y grasas que consumes.",
      },
    ],
    "Por Edades": [
      {
        "titulo": "Jóvenes",
        "desc":
            "Enfocarse en el calcio y hierro para el crecimiento y energía.",
      },
      {
        "titulo": "Adultos Mayores",
        "desc": "Asegurar la ingesta de fibra y Vitamina D para la salud ósea.",
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text("Consejos Saludables"),
        backgroundColor: Colors.orange[700],
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          // --- FILA DE BOTONES (CATEGORÍAS) ---
          Container(
            height: 60,
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              children: [
                _botonCategoria("Nutrición", Icons.apple, Colors.red),
                _botonCategoria("Hidratación", Icons.water_drop, Colors.blue),
                _botonCategoria(
                  "Ejercicio",
                  Icons.fitness_center,
                  Colors.green,
                ),
                _botonCategoria(
                  "Salud Mental",
                  Icons.psychology,
                  Colors.purple,
                ),
                _botonCategoria(
                  "Estilo de Vida",
                  Icons.wb_sunny,
                  Colors.orange,
                ),
                _botonCategoria("Por Edades", Icons.groups, Colors.brown),
              ],
            ),
          ),

          // --- LISTA DE CONSEJOS DINÁMICA ---
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: datosConsejos[categoriaSeleccionada]!.length,
              itemBuilder: (context, index) {
                final consejo = datosConsejos[categoriaSeleccionada]![index];
                return _cardConsejo(consejo["titulo"]!, consejo["desc"]!);
              },
            ),
          ),
        ],
      ),
    );
  }

  // Widget para crear los botones de arriba
  Widget _botonCategoria(String nombre, IconData icono, Color color) {
    bool seleccionada = categoriaSeleccionada == nombre;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: GestureDetector(
        onTap: () {
          setState(() {
            categoriaSeleccionada = nombre;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: seleccionada ? color : color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: color),
          ),
          child: Row(
            children: [
              Icon(icono, size: 18, color: seleccionada ? Colors.white : color),
              const SizedBox(width: 8),
              Text(
                nombre,
                style: TextStyle(
                  color: seleccionada ? Colors.white : color,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget para las tarjetas de consejos
  Widget _cardConsejo(String titulo, String desc) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.lightbulb, color: Colors.orange),
                const SizedBox(width: 10),
                Text(
                  titulo,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Divider(),
            Text(desc, style: const TextStyle(color: Colors.black87)),
          ],
        ),
      ),
    );
  }
}
