import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
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
  // Movimos el cálculo directamente a una función que se use en el build
  double _obtenerPorcentaje() {
    if (widget.metaCalorica <= 0) return 0.0;
    return (widget.caloriasConsumidas / widget.metaCalorica).clamp(0.0, 1.0);
  }

  // Función auxiliar para obtener la fecha formateada en español de forma dinámica
  String _obtenerFechaActual() {
    final ahora = DateTime.now();
    final meses = [
      'enero',
      'febrero',
      'marzo',
      'abril',
      'mayo',
      'junio',
      'julio',
      'agosto',
      'septiembre',
      'octubre',
      'noviembre',
      'diciembre',
    ];
    return "${ahora.day} de ${meses[ahora.month - 1]}";
  }

  @override
  Widget build(BuildContext context) {
    // Calculamos el porcentaje actual aquí mismo para que siempre sea el real
    final porcentajeActual = _obtenerPorcentaje();

    return Scaffold(
      backgroundColor: const Color(0xFFF2E8D3),
      appBar: AppBar(
        // Modificado: Se añade un Column para meter la fecha debajo del título de bienvenida
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "¡Bienvenido a FoodTrack!",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              _obtenerFechaActual(),
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xFF8A9A5B),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
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
                  value:
                      "${widget.metaCalorica.toInt()}", // Esto mostrará el 1834
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
              value: "${(porcentajeActual * 100).toInt()}%",
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
            Row(
              children: [
                Expanded(child: _buildGraficaSemanal(porcentajeActual)),
                const SizedBox(width: 10),
                Expanded(child: _buildMacrosHoy(porcentajeActual)),
              ],
            ),
            const SizedBox(height: 20),
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

  Widget _buildGraficaSemanal(double porcentaje) {
    // Obtenemos el día de la semana actual (1 = Lunes, 2 = Martes, ..., 7 = Domingo)
    final diaActual = DateTime.now().weekday;

    return _buildSection(
      title: "Progreso Semanal",
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Modificado: El día correspondiente a hoy se marca dinámicamente y consume el porcentaje real
          _barrita(
            "L",
            diaActual == 1 ? porcentaje : 0.3,
            isToday: diaActual == 1,
          ),
          _barrita(
            "M",
            diaActual == 2 ? porcentaje : 0.5,
            isToday: diaActual == 2,
          ),
          _barrita(
            "M",
            diaActual == 3 ? porcentaje : 0.2,
            isToday: diaActual == 3,
          ),
          _barrita(
            "J",
            diaActual == 4 ? porcentaje : 0.8,
            isToday: diaActual == 4,
          ),
          _barrita(
            "V",
            diaActual == 5 ? porcentaje : 0.4,
            isToday: diaActual == 5,
          ),
          _barrita(
            "S",
            diaActual == 6 ? porcentaje : 0.6,
            isToday: diaActual == 6,
          ),
          _barrita(
            "D",
            diaActual == 7 ? porcentaje : 0.1,
            isToday: diaActual == 7,
          ),
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

  Widget _buildMacrosHoy(double porcentaje) {
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
                  fontSize: 12,
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
