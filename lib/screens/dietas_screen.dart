import 'package:flutter/material.dart';

class DietasScreen extends StatelessWidget {
  const DietasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF6E3), // Fondo beige suave
      appBar: AppBar(
        title: const Text("Planes de Alimentación"),
        backgroundColor: const Color(0xFF4A90E2),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // 1. DIETA BALANCEADA (AZUL)
          _buildPlanAlimentacion(
            context,
            colorBase: const Color(0xFF4A90E2),
            iconoPrincipal: Icons.track_changes_outlined,
            tituloPlan: "Dieta Balanceada",
            descripcionPlan:
                "Plan equilibrado para mantenimiento y salud general.",
            calorias: "2000-2200 kcal",
            duracion: "Estilo de vida",
            dificultad: "Fácil",
            adecuadoPara: [
              "Todas las edades",
              "Mantenimiento",
              "Principiantes",
            ],
            planComidas: {
              "Desayuno (400-500 kcal)": [
                "Avena con frutas",
                "Yogur griego",
                "1 plátano",
              ],
              "Almuerzo (600-700 kcal)": [
                "Pollo a la plancha",
                "Arroz integral",
                "Ensalada",
              ],
              "Cena (500-600 kcal)": [
                "Salmón al horno",
                "Batata asada",
                "Infusión",
              ],
            },
            beneficios: [
              "Equilibrio óptimo",
              "Fácil de seguir",
              "Rica en vitaminas",
            ],
          ),

          const SizedBox(height: 25),

          // 2. PLAN DE PÉRDIDA DE PESO (ROJO)
          _buildPlanAlimentacion(
            context,
            colorBase: const Color(0xFFE57373), // Rojo/Rosa de tu imagen
            iconoPrincipal: Icons.trending_down,
            tituloPlan: "Plan de Pérdida de Peso",
            descripcionPlan:
                "Déficit calórico controlado para perder peso de forma saludable.",
            calorias: "1500-1700 kcal",
            duracion: "8-12 semanas",
            dificultad: "Moderado",
            adecuadoPara: ["Adultos", "Pérdida de peso", "Sobrepeso"],
            planComidas: {
              "Desayuno (300-350 kcal)": [
                "2 huevos revueltos",
                "1 rebanada pan integral",
                "Café sin azúcar",
              ],
              "Almuerzo (500-550 kcal)": [
                "Ensalada de pollo",
                "Verduras frescas",
                "Agua con limón",
              ],
              "Cena (400-450 kcal)": [
                "Pescado blanco",
                "Espinacas salteadas",
                "Ensalada verde",
              ],
            },
            beneficios: [
              "Déficit seguro",
              "Bajo en carbohidratos",
              "Rica en fibra",
            ],
          ),

          const SizedBox(height: 25),

          // 3. GANANCIA DE MASA MUSCULAR (VERDE)
          _buildPlanAlimentacion(
            context,
            colorBase: const Color(0xFF66BB6A), // Verde de tu imagen
            iconoPrincipal: Icons.fitness_center,
            tituloPlan: "Ganancia de Masa Muscular",
            descripcionPlan:
                "Plan alto en proteínas y calorías para ganar masa magra.",
            calorias: "2500-2800 kcal",
            duracion: "12-16 semanas",
            dificultad: "Avanzado",
            adecuadoPara: ["Deportistas", "Entrenamiento de fuerza", "Jóvenes"],
            planComidas: {
              "Desayuno (600-650 kcal)": [
                "Batido de proteína",
                "3 huevos completos",
                "Mantequilla de maní",
              ],
              "Almuerzo (800-850 kcal)": [
                "Pechuga de pollo (200g)",
                "Pasta integral",
                "Aguacate",
              ],
              "Cena (600-650 kcal)": [
                "Carne magra",
                "Batata grande",
                "Brócoli y espinacas",
              ],
            },
            beneficios: [
              "Superávit controlado",
              "Alta ingesta proteína",
              "Soporte muscular",
            ],
          ),

          const SizedBox(height: 30),
          _buildImportantNote(), // La nota amarilla al final
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // --- LOS WIDGETS DE APOYO (DEBEN IR DENTRO DE LA CLASE) ---

  Widget _buildPlanAlimentacion(
    BuildContext context, {
    required Color colorBase,
    required IconData iconoPrincipal,
    required String tituloPlan,
    required String descripcionPlan,
    required String calorias,
    required String duracion,
    required String dificultad,
    required List<String> adecuadoPara,
    required Map<String, List<String>> planComidas,
    required List<String> beneficios,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [colorBase, colorBase.withOpacity(0.7)],
              ),
            ),
            child: Row(
              children: [
                Icon(iconoPrincipal, color: Colors.white, size: 35),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tituloPlan,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        descripcionPlan,
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _badge(colorBase, Icons.bolt, calorias),
                    _badge(colorBase, Icons.calendar_today, duracion),
                    _badge(colorBase, Icons.speed, dificultad),
                  ],
                ),
                const SizedBox(height: 15),
                Wrap(
                  spacing: 8,
                  children: adecuadoPara
                      .map(
                        (e) => Chip(
                          label: Text(
                            e,
                            style: TextStyle(fontSize: 10, color: colorBase),
                          ),
                          backgroundColor: colorBase.withOpacity(0.1),
                          side: BorderSide.none,
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Ejemplo de comidas:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                ...planComidas.entries.map(
                  (e) => Text(
                    "• ${e.key}: ${e.value.join(', ')}",
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Beneficios:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                ...beneficios.map(
                  (e) => Row(
                    children: [
                      Icon(Icons.check, size: 14, color: colorBase),
                      const SizedBox(width: 5),
                      Text(e, style: const TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _badge(Color c, IconData i, String t) {
    return Column(
      children: [
        Icon(i, color: c, size: 18),
        Text(
          t,
          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildImportantNote() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFDE7),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFFFF176)),
      ),
      child: const Text(
        "Importante: Estos planos son orientativos. Consulte con un nutricionista antes de iniciar.",
        style: TextStyle(
          fontSize: 11,
          color: Color(0xFF827717),
          fontStyle: FontStyle.italic,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
