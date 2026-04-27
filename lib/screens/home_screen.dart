import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Datos conectados a tu calculadora
  final double metaCalorica = 1858.0;

  // Lista de alimentos del registro
  final List<Map<String, dynamic>> comidasHoy = [
    {
      "nombre": "Plátano",
      "momento": "Cena",
      "cal": 105,
      "p": 1.3,
      "c": 27,
      "g": 0.4,
    },
    {
      "nombre": "Fresa",
      "momento": "Cena",
      "cal": 49,
      "p": 1,
      "c": 12,
      "g": 0.5,
    },
    {
      "nombre": "Leche entera",
      "momento": "Cena",
      "cal": 149,
      "p": 8,
      "c": 12,
      "g": 8,
    },
    {
      "nombre": "Pan integral",
      "momento": "Cena",
      "cal": 69,
      "p": 3.6,
      "c": 12,
      "g": 1.1,
    },
  ];

  double get totalCal => comidasHoy.fold(0, (sum, item) => sum + item['cal']);
  double get totalProt => comidasHoy.fold(0, (sum, item) => sum + item['p']);
  double get totalCarbs => comidasHoy.fold(0, (sum, item) => sum + item['c']);
  double get totalGrasas => comidasHoy.fold(0, (sum, item) => sum + item['g']);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2E8D3), // Fondo Arena exacto
      appBar: AppBar(
        title: const Text(
          "¡Bienvenido a FoodTrack!",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF8A9A5B), // Verde Oliva
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // --- FILA DE TARJETAS (ROJO, VERDE, AZUL) ---
            Row(
              children: [
                _buildCard(
                  flex: 1,
                  color: Colors.redAccent,
                  title: "Calorías de Hoy",
                  value: "${totalCal.toInt()}",
                  subtitle: "de ${metaCalorica.toInt()} kcal",
                  icon: Icons.local_fire_department,
                ),
                const SizedBox(width: 10),
                _buildCard(
                  flex: 1,
                  color: const Color(0xFF00C853),
                  title: "Meta Diario",
                  value: "${metaCalorica.toInt()}",
                  subtitle: "Quedan ${(metaCalorica - totalCal).toInt()} kcal",
                  icon: Icons.track_changes,
                ),
              ],
            ),
            const SizedBox(height: 10),
            _buildCard(
              flex: 0,
              color: Colors.blueAccent,
              title: "Progreso",
              value: "${((totalCal / metaCalorica) * 100).toInt()}%",
              subtitle: "completado",
              icon: Icons.trending_up,
              btn: ElevatedButton.icon(
                onPressed: () => Navigator.pushNamed(context, '/registro'),
                icon: const Icon(Icons.add, size: 16),
                label: const Text("agregar comida"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white24,
                  elevation: 0,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // --- GRÁFICAS (PROGRESO SEMANAL Y MACROS) ---
            Row(
              children: [
                Expanded(
                  child: _buildGraficaPlaceholder(
                    "Progreso Semanal",
                    Icons.bar_chart,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(child: _buildMacrosHoy()),
              ],
            ),

            const SizedBox(height: 20),

            // --- LISTA DE COMIDAS (CON BOTÓN AGREGAR) ---
            _buildSection(
              title: "Comidas de Hoy",
              action: TextButton.icon(
                onPressed: () => Navigator.pushNamed(context, '/registro'),
                icon: const Icon(Icons.add, size: 16),
                label: const Text("Agregar"),
              ),
              child: Column(
                children: comidasHoy.map((c) => _buildFoodItem(c)).toList(),
              ),
            ),

            const SizedBox(height: 20),

            // --- ACCESOS RÁPIDOS INFERIORES ---
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildQuickBtn(
                  "Calcular calorías",
                  Icons.calculate,
                  '/calculadora',
                ),
                _buildQuickBtn("Planes de Dieta", Icons.restaurant, '/dietas'),
                _buildQuickBtn("Consejos", Icons.lightbulb, '/consejos'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({
    required int flex,
    required Color color,
    required String title,
    required String value,
    required String subtitle,
    required IconData icon,
    Widget? btn,
  }) {
    Widget card = Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 11),
              ),
              Icon(icon, color: Colors.white, size: 16),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            subtitle,
            style: const TextStyle(color: Colors.white70, fontSize: 10),
          ),
          if (btn != null) ...[const SizedBox(height: 10), btn],
        ],
      ),
    );
    return flex > 0 ? Expanded(flex: flex, child: card) : card;
  }

  Widget _buildMacrosHoy() {
    return _buildSection(
      title: "Macros de Hoy",
      child: Column(
        children: [
          const Icon(Icons.pie_chart, size: 50, color: Colors.blueAccent),
          const SizedBox(height: 10),
          _macroRow("${totalProt.toInt()}g", "Proteínas", Colors.green),
          _macroRow("${totalCarbs.toInt()}g", "Carbohidratos", Colors.blue),
          _macroRow("${totalGrasas.toInt()}g", "Grasas", Colors.orange),
        ],
      ),
    );
  }

  Widget _macroRow(String val, String label, Color c) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          CircleAvatar(radius: 4, backgroundColor: c),
          const SizedBox(width: 5),
          Text("$val $label", style: const TextStyle(fontSize: 9)),
        ],
      ),
    );
  }

  Widget _buildFoodItem(Map<String, dynamic> c) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        c['nombre'],
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
      ),
      subtitle: Text(c['momento'], style: const TextStyle(fontSize: 10)),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "${c['cal']} kcal",
            style: const TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "P: ${c['p']} | C: ${c['c']} | G: ${c['g']}",
            style: const TextStyle(fontSize: 8),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    Widget? action,
    required Widget child,
  }) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5B6B3F),
                ),
              ),
              if (action != null) action,
            ],
          ),
          const Divider(),
          child,
        ],
      ),
    );
  }

  Widget _buildQuickBtn(String t, IconData i, String r) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, r),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.28,
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: const Color(0xFF8A9A5B).withOpacity(0.2),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Icon(i, color: const Color(0xFF5B6B3F)),
            const SizedBox(height: 5),
            Text(
              t,
              style: const TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGraficaPlaceholder(String t, IconData i) => _buildSection(
    title: t,
    child: Center(
      child: Icon(i, size: 80, color: Colors.deepPurpleAccent.withOpacity(0.5)),
    ),
  );
}
