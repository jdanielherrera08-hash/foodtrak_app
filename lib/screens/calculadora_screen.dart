import 'package:flutter/material.dart';

class CalculadoraScreen extends StatefulWidget {
  const CalculadoraScreen({super.key});

  @override
  State<CalculadoraScreen> createState() => _CalculadoraScreenState();
}

class _CalculadoraScreenState extends State<CalculadoraScreen> {
  // Controladores para capturar lo que el usuario escribe
  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _alturaController = TextEditingController();

  double? _resultado;
  String _mensaje = "Ingresa tus datos para calcular";
  Color _colorMensaje = Colors.blueGrey;

  void _calcularIMC() {
    final double? peso = double.tryParse(_pesoController.text);
    final double? altura = double.tryParse(_alturaController.text);

    if (peso != null && altura != null && altura > 0) {
      setState(() {
        // Fórmula: peso / (altura * altura)
        _resultado = peso / (altura * altura);

        if (_resultado! < 18.5) {
          _mensaje = "Bajo peso";
          _colorMensaje = Colors.orange;
        } else if (_resultado! >= 18.5 && _resultado! < 24.9) {
          _mensaje = "Peso saludable";
          _colorMensaje = Colors.green;
        } else if (_resultado! >= 25 && _resultado! < 29.9) {
          _mensaje = "Sobrepeso";
          _colorMensaje = Colors.orangeAccent;
        } else {
          _mensaje = "Obesidad";
          _colorMensaje = Colors.red;
        }
      });
    } else {
      setState(() {
        _mensaje = "Por favor, ingresa valores válidos";
        _resultado = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text("Calculadora de IMC"),
        backgroundColor: Colors.teal[700],
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Icon(
              Icons.monitor_weight_outlined,
              size: 80,
              color: Colors.teal,
            ),
            const SizedBox(height: 20),

            // Tarjeta de Input
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _pesoController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "Peso (kg)",
                        hintText: "Ej: 70",
                        prefixIcon: Icon(Icons.fitness_center),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _alturaController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "Altura (metros)",
                        hintText: "Ej: 1.75",
                        prefixIcon: Icon(Icons.height),
                      ),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: _calcularIMC,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "CALCULAR",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Tarjeta de Resultado
            if (_resultado != null)
              Card(
                color: _colorMensaje.withOpacity(0.1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide(color: _colorMensaje, width: 2),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const Text(
                        "TU RESULTADO",
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                      Text(
                        _resultado!.toStringAsFixed(1),
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: _colorMensaje,
                        ),
                      ),
                      Text(
                        _mensaje,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: _colorMensaje,
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
}
