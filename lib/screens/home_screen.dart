import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  // --- RECIBIMOS LOS DATOS REALES DESDE EL MAIN ---
  final double metaCalorica;
  final double caloriasConsumidas;
  final double p;
  final double c;
  final double g;
  final Function(int)? onTabRequested;

  const HomeScreen({
    super.key,
    required this.metaCalorica,
    required this.caloriasConsumidas,
    required this.p,
    required this.c,
    required this.g,
    this.onTabRequested,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Calculamos el porcentaje real para el cuadro azul y las gráficas
  double get porcentaje =>
      (widget.caloriasConsumidas / widget.metaCalorica).clamp(0.0, 1.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2E8D3),
      appBar: AppBar(
        title: const Text(
          "¡Bienvenido a FoodTrack!",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF8A9A5B),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // --- CUADROS DE PROGRESO REALES ---
            Row(
              children: [
                _buildCard(
                  flex: 1,
                  color: Colors.redAccent,
                  title: "Calorías de Hoy",
                  value: "${widget.caloriasConsumidas.toInt()}",
                  subtitle: "de ${widget.metaCalorica.toInt()} kcal",
                  icon: Icons.local_fire_department,
                ),
                const SizedBox(width: 10),
                _buildCard(
                  flex: 1,
                  color: const Color(0xFF00C853),
                  title: "Meta Diario",
                  value: "${widget.metaCalorica.toInt()}",
                  subtitle:
                      "Quedan ${(widget.metaCalorica - widget.caloriasConsumidas).toInt()} kcal",
                  icon: Icons.track_changes,
                ),
              ],
            ),
            const SizedBox(height: 10),
            _buildCard(
              flex: 0,
              color: Colors.blueAccent,
              title: "Progreso",
              value: "${(porcentaje * 100).toInt()}%", // AHORA ES DINÁMICO
              subtitle: "completado",
              icon: Icons.trending_up,
              btn: ElevatedButton.icon(
                onPressed: () => widget.onTabRequested?.call(1),
                icon: const Icon(Icons.add, size: 16),
                label: const Text("agregar comida"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white24,
                  elevation: 0,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // --- GRÁFICAS CONECTADAS ---
            Row(
              children: [
                Expanded(child: _buildGraficaSemanal()),
                const SizedBox(width: 10),
                Expanded(child: _buildMacrosHoy()),
              ],
            ),

            const SizedBox(height: 20),

            // --- ACCESOS RÁPIDOS ---
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildQuickBtn("Calcular calorías", Icons.calculate, 2),
                _buildQuickBtn("Planes de Dieta", Icons.restaurant, 3),
                _buildQuickBtn("Consejos", Icons.lightbulb, 4),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // --- GRÁFICA SEMANAL QUE REACCIONA AL CONSUMO ---
  Widget _buildGraficaSemanal() {
    return _buildSection(
      title: "Progreso Semanal",
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _barrita("L", 0.3), _barrita("M", 0.5), _barrita("M", 0.2),
          _barrita("J", 0.8), _barrita("V", 0.4), _barrita("S", 0.6),
          _barrita(
            "D",
            porcentaje,
            isToday: true,
          ), // El domingo (hoy) sube con tu comida
        ],
      ),
    );
  }

  Widget _barrita(String dia, double alto, {bool isToday = false}) {
    return Column(
      children: [
        Container(
          height: 60 * alto,
          width: 8,
          decoration: BoxDecoration(
            color: isToday ? Colors.orange : Colors.grey[300],
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          dia,
          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildMacrosHoy() {
    return _buildSection(
      title: "Macros de Hoy",
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              CircularProgressIndicator(
                value: porcentaje,
                color: Colors.blueAccent,
                strokeWidth: 8,
              ),
              const Icon(Icons.pie_chart, size: 20, color: Colors.blueAccent),
            ],
          ),
          const SizedBox(height: 10),
          _macroRow("${widget.p.toInt()}g", "Proteínas", Colors.green),
          _macroRow("${widget.c.toInt()}g", "Carbohidratos", Colors.blue),
          _macroRow("${widget.g.toInt()}g", "Grasas", Colors.orange),
        ],
      ),
    );
  }

  // --- LOS DEMÁS MÉTODOS DE SOPORTE (_buildCard, _buildSection, etc.) ---

  Widget _macroRow(String val, String label, Color c) {
    return Row(
      children: [
        CircleAvatar(radius: 4, backgroundColor: c),
        const SizedBox(width: 5),
        Text("$val $label", style: const TextStyle(fontSize: 8)),
      ],
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

  Widget _buildSection({
    required String title,
    Widget? action, // Este es el que te marca error
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
          // Fila para el título y la acción opcional
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5B6B3F),
                  fontSize: 12,
                ),
              ),
              if (action != null)
                action, // Aquí ya usamos la variable y desaparece el error
            ],
          ),
          const Divider(),
          child,
        ],
      ),
    );
  }

  Widget _buildQuickBtn(String t, IconData i, int index) {
    return InkWell(
      onTap: () => widget.onTabRequested?.call(index),
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
}
