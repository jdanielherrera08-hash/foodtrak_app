import 'package:flutter/material.dart';

class ConsejosScreen extends StatefulWidget {
  const ConsejosScreen({super.key});

  @override
  State<ConsejosScreen> createState() => _ConsejosScreenState();
}

class _ConsejosScreenState extends State<ConsejosScreen> {
  String categoriaSeleccionada = "Nutrición Básica";

  // Mapa con los 5 consejos por cada categoría según tus capturas
  final Map<String, List<Map<String, String>>> contenidoConsejos = {
    "Nutrición Básica": [
      {
        "titulo": "El poder del arcoíris",
        "desc":
            "Ven frutas y verduras de diferentes colores cada día. Cada color representa diferentes nutrientes.",
        "icon": "🌈",
      },
      {
        "titulo": "Proteína en cada comida",
        "desc":
            "Incluye carne, pescado, huevos o legumbres para mantener la saciedad y masa muscular.",
        "icon": "🥩",
      },
      {
        "titulo": "Carbohidratos inteligentes",
        "desc":
            "Prefiere complejos como avena y arroz integral. Liberan energía de forma gradual.",
        "icon": "🌾",
      },
      {
        "titulo": "Grasas saludables",
        "desc":
            "Aguacate, nueces y aceite de oliva son esenciales para la salud hormonal y cerebral.",
        "icon": "🥑",
      },
      {
        "titulo": "Controla las porciones",
        "desc":
            "Usa tu mano como guía: palma para proteínas, puño para carbohidratos.",
        "icon": "✋",
      },
    ],
    "Hidratación": [
      {
        "titulo": "Agua como prioridad",
        "desc":
            "Haz del agua tu fuente principal de hidratación durante todo el día.",
        "icon": "💧",
      },
      {
        "titulo": "Escucha tu sed",
        "desc":
            "No esperes a tener la boca seca; la sed es una señal tardía de deshidratación.",
        "icon": "👂",
      },
      {
        "titulo": "Evita bebidas azucaradas",
        "desc":
            "Refrescos y jugos procesados añaden calorías vacías sin hidratar realmente.",
        "icon": "🚫",
      },
      {
        "titulo": "Hidratación y ejercicio",
        "desc":
            "Bebe agua antes, durante y después de cualquier actividad física intensa.",
        "icon": "🏃",
      },
      {
        "titulo": "Frutas acuosas",
        "desc":
            "Consume sandía, pepino o naranja para obtener hidratación extra mediante la comida.",
        "icon": "🍉",
      },
    ],
    "Ejercicio y Actividad": [
      {
        "titulo": "Movimiento diario",
        "desc":
            "Intenta caminar al menos 30 minutos al día para mantener activo tu metabolismo.",
        "icon": "🚶",
      },
      {
        "titulo": "Entrenamiento de fuerza",
        "desc":
            "Ayuda a fortalecer huesos y aumentar el gasto calórico incluso en reposo.",
        "icon": "🏋️",
      },
      {
        "titulo": "Estiramientos",
        "desc":
            "Mejora la flexibilidad y reduce el riesgo de lesiones musculares.",
        "icon": "🧘",
      },
      {
        "titulo": "Descanso activo",
        "desc":
            "En tus días libres, realiza actividades ligeras como pasear o jugar.",
        "icon": "🎾",
      },
      {
        "titulo": "Consistencia",
        "desc":
            "Es mejor hacer poco frecuentemente que mucho una sola vez a la semana.",
        "icon": "📅",
      },
    ],
    "Salud Mental": [
      {
        "titulo": "Alimentación consciente",
        "desc":
            "Come sin distracciones (sin móvil) para notar mejor tus señales de saciedad.",
        "icon": "🧠",
      },
      {
        "titulo": "Sueño reparador",
        "desc":
            "Dormir 7-8 horas es vital para regular las hormonas del hambre.",
        "icon": "😴",
      },
      {
        "titulo": "Manejo del estrés",
        "desc":
            "El cortisol elevado por estrés puede aumentar los antojos por dulce.",
        "icon": "🧘‍♂️",
      },
      {
        "titulo": "Permítete disfrutar",
        "desc":
            "La salud mental incluye disfrutar de tus comidas favoritas sin culpa.",
        "icon": "🍕",
      },
      {
        "titulo": "Conexión social",
        "desc":
            "Compartir comidas con amigos o familia mejora el bienestar emocional.",
        "icon": "👥",
      },
    ],
    "Estilo de Vida": [
      {
        "titulo": "Planificación semanal",
        "desc":
            "Prepara tus comidas con antelación para evitar elegir opciones poco saludables.",
        "icon": "🍱",
      },
      {
        "titulo": "Lee etiquetas",
        "desc":
            "Revisa los ingredientes para evitar excesos de sodio y azúcares ocultos.",
        "icon": "🔍",
      },
      {
        "titulo": "Cocina en casa",
        "desc":
            "Te permite tener control total sobre la calidad y cantidad de grasa y sal.",
        "icon": "👨‍🍳",
      },
      {
        "titulo": "Pequeños cambios",
        "desc":
            "Sustituye el elevador por las escaleras siempre que sea posible.",
        "icon": "🪜",
      },
      {
        "titulo": "Rodéate de salud",
        "desc": "Ten a la mano snacks saludables como fruta o frutos secos.",
        "icon": "🍎",
      },
    ],
    "Por Edades": [
      {
        "titulo": "Crecimiento (Niños)",
        "desc":
            "Enfoque en calcio y proteínas para el desarrollo de huesos y músculos.",
        "icon": "👦",
      },
      {
        "titulo": "Energía (Jóvenes)",
        "desc":
            "Priorizar carbohidratos complejos para el alto gasto energético y estudio.",
        "icon": "🎓",
      },
      {
        "titulo": "Balance (Adultos)",
        "desc":
            "Mantener un equilibrio calórico para prevenir enfermedades metabólicas.",
        "icon": "👩",
      },
      {
        "titulo": "Vitalidad (Seniors)",
        "desc":
            "Aumentar el consumo de fibra y mantenerse muy bien hidratados.",
        "icon": "👴",
      },
      {
        "titulo": "Necesidades únicas",
        "desc":
            "Consulta siempre a un profesional para ajustar la dieta según tu etapa vital.",
        "icon": "⚕️",
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2E8D3), // Color arena de fondo
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 60),
            _buildHeader(),
            _buildCategorias(),
            _buildListaConsejos(),
            _buildConsejoDelDia(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.lightbulb_outline, color: Colors.orange),
              SizedBox(width: 10),
              Text(
                "Consejos de Nutrición",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 5),
          Text(
            "Aprende hábitos saludables y consejos prácticos.",
            style: TextStyle(color: Colors.grey, fontSize: 13),
          ),
        ],
      ),
    );
  }

  Widget _buildCategorias() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: contenidoConsejos.keys.map((cat) {
          bool isSelected = categoriaSeleccionada == cat;
          return GestureDetector(
            onTap: () => setState(() => categoriaSeleccionada = cat),
            child: Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFFE8F5E9) : Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: isSelected ? Colors.green : Colors.transparent,
                ),
              ),
              child: Text(
                cat,
                style: TextStyle(
                  color: isSelected ? Colors.green : Colors.black54,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildListaConsejos() {
    return Column(
      children: contenidoConsejos[categoriaSeleccionada]!.map((c) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.green.withOpacity(0.1)),
          ),
          child: Row(
            children: [
              Text(c["icon"]!, style: const TextStyle(fontSize: 30)),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      c["titulo"]!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2E7D32),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      c["desc"]!,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildConsejoDelDia() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.blueAccent, Colors.purpleAccent],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Column(
        children: [
          Text(
            "Consejo del Día",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            "\"La nutrición perfecta no existe. Lo que funciona es la consistencia con hábitos saludables.\"",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}
