import 'package:flutter/material.dart';

class CalculadoraScreen extends StatefulWidget {
  // 1. Esto permite que la calculadora le devuelva la meta al main
  final Function(double nuevaMeta) onMetaCalculada;

  // 2. El constructor que acepta la función
  const CalculadoraScreen({super.key, required this.onMetaCalculada});
  @override
  State<CalculadoraScreen> createState() => _CalculadoraScreenState();
}

class _CalculadoraScreenState extends State<CalculadoraScreen> {
  final _formKey = GlobalKey<FormState>();
  final _edadController = TextEditingController();
  final _pesoController = TextEditingController();
  final _alturaController = TextEditingController();

  String _genero = 'Masculino';
  String _nivelActividad = 'Sedentario';
  String _objetivo = 'Mantenimiento';

  double? _tmb, _tdee, _caloriasObjetivo;

  // Colores base de tu diseño
  final Color greenPrimary = const Color(0xFF8A9A5B);
  final Color sandBackground = const Color(0xFFF2E8D3);

  void _calcularTodo() {
    if (_formKey.currentState!.validate()) {
      double peso = double.parse(_pesoController.text);
      double altura = double.parse(_alturaController.text);
      int edad = int.parse(_edadController.text);

      setState(() {
        if (_genero == 'Masculino') {
          _tmb = (10 * peso) + (6.25 * altura) - (5 * edad) + 5;
        } else {
          _tmb = (10 * peso) + (6.25 * altura) - (5 * edad) - 161;
        }

        double factor = 1.2;
        if (_nivelActividad == 'Ligero') factor = 1.375;
        if (_nivelActividad == 'Moderado') factor = 1.55;
        if (_nivelActividad == 'Activo') factor = 1.725;
        if (_nivelActividad == 'Muy activo') factor = 1.9;

        _tdee = _tmb! * factor;

        if (_objetivo == 'Perdida de peso')
          _caloriasObjetivo = _tdee! - 500;
        else if (_objetivo == 'Aumento de masa')
          _caloriasObjetivo = _tdee! + 300;
        else
          _caloriasObjetivo = _tdee!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: sandBackground,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 40),
              _buildInputCard(),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _calcularTodo,
                style: ElevatedButton.styleFrom(
                  backgroundColor: greenPrimary,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Calcular',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              if (_tmb != null) ...[
                const SizedBox(height: 25),
                _buildGradientCard('TMB (Metabolismo Basal)', _tmb!, [
                  Colors.orange,
                  Colors.redAccent,
                ]),
                _buildGradientCard('TDEE (Gasto Total)', _tdee!, [
                  Colors.blueAccent,
                  Colors.purpleAccent,
                ]),
                _buildGradientCard('Calorías Objetivo', _caloriasObjetivo!, [
                  Colors.green,
                  Colors.teal,
                ]),
                const SizedBox(height: 20),
                _buildMacrosCard(),
              ],
              const SizedBox(height: 30),
              _buildFooterInfo(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: _genderBtn('Masculino')),
                const SizedBox(width: 10),
                Expanded(child: _genderBtn('Femenino')),
              ],
            ),
            const SizedBox(height: 20),
            _inputField(_edadController, 'Edad', Icons.calendar_today),
            const SizedBox(height: 15),
            _inputField(_pesoController, 'Peso (kg)', Icons.monitor_weight),
            const SizedBox(height: 15),
            _inputField(_alturaController, 'Altura (cm)', Icons.height),
            const SizedBox(height: 20),
            _dropdown(
              'Actividad',
              _nivelActividad,
              ['Sedentario', 'Ligero', 'Moderado', 'Activo', 'Muy activo'],
              (v) => setState(() => _nivelActividad = v!),
            ),
            const SizedBox(height: 15),
            _dropdown('Objetivo', _objetivo, [
              'Perdida de peso',
              'Mantenimiento',
              'Aumento de masa',
            ], (v) => setState(() => _objetivo = v!)),
          ],
        ),
      ),
    );
  }

  Widget _buildGradientCard(String title, double value, List<Color> colors) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
          Text(
            '${value.toInt()}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'Calorías diarias',
            style: TextStyle(color: Colors.white70, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildMacrosCard() {
    // Cálculo simple de macros basado en calorías objetivo
    double p = (_caloriasObjetivo! * 0.30) / 4;
    double c = (_caloriasObjetivo! * 0.40) / 4;
    double g = (_caloriasObjetivo! * 0.30) / 9;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Recomendación de Macros',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 20),
            _macroRow('Proteínas (30%)', '${p.toInt()}g', 0.3, Colors.green),
            _macroRow('Carbohidratos (40%)', '${c.toInt()}g', 0.4, Colors.blue),
            _macroRow('Grasas (30%)', '${g.toInt()}g', 0.3, Colors.orange),
          ],
        ),
      ),
    );
  }

  Widget _macroRow(String label, String value, double progress, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label),
              Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.grey[200],
            color: color,
            minHeight: 8,
          ),
        ],
      ),
    );
  }

  Widget _genderBtn(String label) {
    bool sel = _genero == label;
    return GestureDetector(
      onTap: () => setState(() => _genero = label),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: sel ? greenPrimary.withOpacity(0.2) : Colors.transparent,
          border: Border.all(color: sel ? greenPrimary : Colors.grey[300]!),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: sel ? greenPrimary : Colors.black54,
              fontWeight: sel ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  Widget _inputField(TextEditingController ctrl, String label, IconData icon) {
    return TextFormField(
      controller: ctrl,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: greenPrimary),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      validator: (v) => v!.isEmpty ? 'Campo requerido' : null,
    );
  }

  Widget _dropdown(
    String label,
    String val,
    List<String> items,
    Function(String?) onChange,
  ) {
    return DropdownButtonFormField<String>(
      value: val,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      items: items
          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
          .toList(),
      onChanged: onChange,
    );
  }

  Widget _buildFooterInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Información sobre los cálculos',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: greenPrimary,
          ),
        ),
        const Divider(),
        _footerItem(
          '¿Qué es el TMB?',
          'Es el mínimo de energía que tu cuerpo necesita para sobrevivir en reposo.',
        ),
        _footerItem(
          '¿Qué es el TDEE?',
          'Es el total de energía que gastas sumando tu actividad física diaria.',
        ),
      ],
    );
  }

  Widget _footerItem(String t, String d) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(t, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(d, style: const TextStyle(color: Colors.black54, fontSize: 13)),
        ],
      ),
    );
  }
}
