import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _caloriasIngeridas = 617;
  int _metaDiaria = 1282;

  @override
  Widget build(BuildContext context) {
    double porcentaje = _caloriasIngeridas / _metaDiaria;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFDF6E3), Color(0xFFF0F0F0)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                const SizedBox(height: 20),
                _buildTopCards(porcentaje),
                const SizedBox(height: 25),

                // --- SECCIÓN DE GRÁFICAS ---
                Row(
                  children: [
                    _buildWeeklyChart(), // Gráfica de barras
                    const SizedBox(width: 10),
                    _buildMacrosChart(), // Gráfica circular
                  ],
                ),

                const SizedBox(height: 25),
                _buildFoodList(), // Lista de alimentos consumidos
                const SizedBox(height: 25),
                _buildBottomButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 1. Encabezado
  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "¡Bienvenido!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Icon(Icons.calendar_month, color: Colors.grey[600]),
          ],
        ),
        Text("domingo, 26 de abril", style: TextStyle(color: Colors.grey[600])),
      ],
    );
  }

  // 2. Tarjetas de colores (Rojo, Verde, Azul)
  Widget _buildTopCards(double porcentaje) {
    return Row(
      children: [
        _infoCard(Colors.red, "Ingerido", "$_caloriasIngeridas", "kcal"),
        const SizedBox(width: 8),
        _infoCard(Colors.green, "Meta", "$_metaDiaria", "objetivo"),
        const SizedBox(width: 8),
        _infoCard(
          Colors.blue,
          "Progreso",
          "${(porcentaje * 100).toInt()}%",
          "diario",
          hasButton: true,
        ),
      ],
    );
  }

  // 3. Gráfica de Barras (Progreso Semanal)
  Widget _buildWeeklyChart() {
    return Expanded(
      flex: 2,
      child: Container(
        height: 180,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            const Text(
              "Progreso Semanal",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: BarChart(
                BarChartData(
                  borderData: FlBorderData(show: false),
                  titlesData: const FlTitlesData(show: false),
                  barGroups: [
                    _makeBar(0, 5),
                    _makeBar(1, 8),
                    _makeBar(2, 6),
                    _makeBar(3, 9),
                    _makeBar(4, 4),
                    _makeBar(5, 7),
                    _makeBar(6, 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 4. Gráfica Circular (Macros)
  Widget _buildMacrosChart() {
    return Expanded(
      flex: 1,
      child: Container(
        height: 180,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            const Text(
              "Macros",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: PieChart(
                PieChartData(
                  sectionsSpace: 2,
                  centerSpaceRadius: 20,
                  sections: [
                    PieChartSectionData(
                      color: Colors.red,
                      value: 40,
                      title: 'P',
                      radius: 15,
                      titleStyle: const TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                      ),
                    ),
                    PieChartSectionData(
                      color: Colors.blue,
                      value: 30,
                      title: 'C',
                      radius: 15,
                      titleStyle: const TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                      ),
                    ),
                    PieChartSectionData(
                      color: Colors.yellow[700],
                      value: 30,
                      title: 'G',
                      radius: 15,
                      titleStyle: const TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 5. Lista de alimentos (Resumen)
  Widget _buildFoodList() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          _foodRow("Manzana", "52 kcal", "Carbohidratos"),
          const Divider(),
          _foodRow("Huevo Cocido", "70 kcal", "Proteínas"),
        ],
      ),
    );
  }

  // --- WIDGETS DE APOYO ---

  Widget _infoCard(
    Color color,
    String label,
    String val,
    String sub, {
    bool hasButton = false,
  }) {
    return Expanded(
      child: Container(
        height: 130,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.2)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              val,
              style: TextStyle(
                color: color,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              sub,
              style: TextStyle(color: color.withOpacity(0.7), fontSize: 9),
            ),
            if (hasButton) ...[
              const SizedBox(height: 5),
              Icon(Icons.add_circle, color: color, size: 20),
            ],
          ],
        ),
      ),
    );
  }

  BarChartGroupData _makeBar(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: Colors.green[400],
          width: 8,
          borderRadius: BorderRadius.circular(2),
        ),
      ],
    );
  }

  Widget _foodRow(String name, String cal, String type) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(
              type,
              style: const TextStyle(fontSize: 10, color: Colors.grey),
            ),
          ],
        ),
        Text(
          cal,
          style: const TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildBottomButtons() {
    return Row(
      children: [
        _smallBtn("Calcular", Icons.calculate),
        const SizedBox(width: 10),
        _smallBtn("Dietas", Icons.restaurant),
        const SizedBox(width: 10),
        _smallBtn("Consejos", Icons.tips_and_updates),
      ],
    );
  }

  Widget _smallBtn(String t, IconData i) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Colors.teal[50],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Icon(i, size: 20, color: Colors.teal),
            Text(t, style: const TextStyle(fontSize: 10)),
          ],
        ),
      ),
    );
  }
}
