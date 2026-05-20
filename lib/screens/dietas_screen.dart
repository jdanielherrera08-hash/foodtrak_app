import 'package:flutter/material.dart';
import '../gemini_service.dart'; // Los .. sirven para salir de la carpeta screens

class DietasScreen extends StatefulWidget {
  const DietasScreen({super.key});

  @override
  State<DietasScreen> createState() => _DietasScreenState();
}

class _DietasScreenState extends State<DietasScreen> {
  // Variables obligatorias para el control de la IA
  final GeminiService _geminiService = GeminiService();
  final TextEditingController _aiController = TextEditingController();
  String _respuestaIA = "";
  bool _cargandoIA = false;

  void _enviarPregunta() async {
    if (_aiController.text.trim().isEmpty) return;

    setState(() {
      _cargandoIA = true;
      _respuestaIA = ""; // Limpiamos la respuesta anterior mientras carga
    });

    String resultado = await _geminiService.consultarDieta(_aiController.text);

    setState(() {
      _respuestaIA = resultado;
      _cargandoIA = false;
      _aiController.clear(); // Limpia la barra de texto al finalizar
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2E8D3),
      appBar: AppBar(
        title: const Text("Planes de Alimentación"),
        backgroundColor: const Color(0xFF8A9A5B),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // ==================== APARTADO DE IA (HASTA ARRIBA) ====================
          const Text(
            "Pregúntale a la IA de FoodTrak",
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Color(0xFF5C6738),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _aiController,
                  decoration: InputDecoration(
                    hintText: "Ej: ¿Qué puedo cenar con 400 kcal?",
                    filled: true,
                    fillColor: Colors.white,
                    hintStyle: const TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFF8A9A5B)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Color(0xFF8A9A5B),
                        width: 2,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                icon: _cargandoIA
                    ? const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Color(0xFF8A9A5B),
                        ),
                      )
                    : const Icon(Icons.auto_awesome, color: Color(0xFF8A9A5B)),
                onPressed: _cargandoIA ? null : _enviarPregunta,
              ),
            ],
          ),
          if (_respuestaIA.isNotEmpty) ...[
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF8A9A5B).withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color(0xFF8A9A5B).withOpacity(0.3),
                ),
              ),
              child: Text(
                _respuestaIA,
                style: const TextStyle(
                  fontSize: 12.5,
                  fontStyle: FontStyle.italic,
                  color: Color(0xFF3B441F),
                ),
              ),
            ),
          ],
          const Divider(height: 32, thickness: 1, color: Color(0xFFD4CBB5)),

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
              "Desayuno (400-500 kcal)":
                  "Avena con leche y frutos rojos (1 taza), Yogur griego (125g), Semillas de chía/linaza, Té o café.",
              "Media Mañana": "Manzana, Puñado de almendras (25g).",
              "Almuerzo (600-700 kcal)":
                  "Pechuga de pollo a la plancha (150g), Arroz integral (1 taza), Ensalada mixta con aceite de oliva.",
              "Merienda": "Batido verde, Fresas (1 taza).",
              "Cena (500-600 kcal)":
                  "Salmón a la plancha (125g), Batata asada, Espárragos, Infusión.",
            },
            beneficios: [
              "Equilibrio óptimo de nutrientes",
              "Fácil de seguir a largo plazo",
              "Rica en vitaminas y minerales",
            ],
          ),

          const SizedBox(height: 25),

          // 2. PLAN DE PÉRDIDA DE PESO (ROJO)
          _buildPlanAlimentacion(
            context,
            colorBase: const Color(0xFFE57373),
            iconoPrincipal: Icons.trending_down,
            tituloPlan: "Plan de Pérdida de Peso",
            descripcionPlan:
                "Déficit calórico controlado para perder peso de forma saludable.",
            calorias: "1500-1700 kcal",
            duracion: "8-12 semanas",
            dificultad: "Moderado",
            adecuadoPara: ["Adultos", "Pérdida de peso", "Sobrepeso"],
            planComidas: {
              "Desayuno (300-350 kcal)":
                  "2 huevos revueltos, Pan integral tostado (1 rebanada), Tomate en rodajas, Café sin azúcar.",
              "Media Mañana": "10 almendras.",
              "Almuerzo (500-550 kcal)":
                  "Ensalada de pollo (150g pechuga), Variedad de vegetales frescos, Lentejas (1/2 taza).",
              "Merienda": "Bebé zanahoria, Yogur natural descremado.",
              "Cena (400-450 kcal)":
                  "Pescado blanco a la plancha (150g), Brócoli al vapor, Ensalada verde.",
            },
            beneficios: [
              "Déficit calórico seguro",
              "Bajo en azúcares procesados",
              "Rica en fibra para mayor saciedad",
            ],
          ),

          const SizedBox(height: 25),

          // 3. GANANCIA DE MASA MUSCULAR (VERDE)
          _buildPlanAlimentacion(
            context,
            colorBase: const Color(0xFF66BB6A),
            iconoPrincipal: Icons.fitness_center,
            tituloPlan: "Ganancia de Masa Muscular",
            descripcionPlan:
                "Plan alto en proteínas y calorías para ganar masa magra.",
            calorias: "2500-2800 kcal",
            duracion: "12-16 semanas",
            dificultad: "Avanzado",
            adecuadoPara: ["Deportistas", "Entrenamiento de fuerza", "Jóvenes"],
            planComidas: {
              "Desayuno (600-700 kcal)":
                  "3 huevos enteros, Arroz blanco (1 taza), Mantequilla de maní (2 cdas).",
              "Media Mañana": "1 plátano mediano, 2 huevos duros.",
              "Almuerzo (800-850 kcal)":
                  "Carne magra de res (150g), Arroz integral (1.5 tazas), Frijoles negros (1/2 taza).",
              "Post-Entreno":
                  "Batido de proteína (40g), Plátano, Avena (1/2 taza).",
              "Cena (500-600 kcal)":
                  "Carne magra o pescado (200g), Batata grande, Ensalada verde mixta.",
            },
            beneficios: [
              "Superávit energético controlado",
              "Alta ingesta de proteína de calidad",
              "Soporte para la recuperación muscular",
            ],
          ),

          const SizedBox(height: 30),
          _buildImportantNote(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

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
    required Map<String, String> planComidas,
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
                const Text(
                  "Ejemplo de comidas:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
                const SizedBox(height: 8),
                ...planComidas.entries.map(
                  (e) => Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      "• ${e.key}: ${e.value}",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
                const Divider(height: 24),
                const Text(
                  "Beneficios:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
                const SizedBox(height: 8),
                ...beneficios.map(
                  (e) => Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Row(
                      children: [
                        Icon(
                          Icons.check_circle_outline,
                          size: 16,
                          color: colorBase,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(e, style: const TextStyle(fontSize: 12)),
                        ),
                      ],
                    ),
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
        "Importante: Estos planes son orientativos. Consulte con un nutricionista antes de iniciar.",
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
