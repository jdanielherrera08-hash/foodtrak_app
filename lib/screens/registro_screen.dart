import 'package:flutter/material.dart';

class RegistroScreen extends StatefulWidget {
  const RegistroScreen({super.key});

  @override
  State<RegistroScreen> createState() => _RegistroScreenState();
}

class _RegistroScreenState extends State<RegistroScreen> {
  // Lista de alimentos con sus cantidades (en una app real esto vendría de una base de datos)
  final List<Map<String, dynamic>> alimentos = [
    {
      "nombre": "Huevo (unidad)",
      "calorias": 70,
      "cantidad": 0,
      "categoria": "Proteína",
    },
    {
      "nombre": "Pan Integral (rebanada)",
      "calorias": 80,
      "cantidad": 0,
      "categoria": "Carbohidratos",
    },
    {
      "nombre": "Leche (vaso)",
      "calorias": 120,
      "cantidad": 0,
      "categoria": "Lácteos",
    },
    {
      "nombre": "Manzana (unidad)",
      "calorias": 52,
      "cantidad": 0,
      "categoria": "Fruta",
    },
    {
      "nombre": "Pollo (100g)",
      "calorias": 165,
      "cantidad": 0,
      "categoria": "Proteína",
    },
    {
      "nombre": "Arroz (taza)",
      "calorias": 200,
      "cantidad": 0,
      "categoria": "Carbohidratos",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Las 4 comidas del día
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Registrar Alimento"),
          backgroundColor: Colors.green[600],
          foregroundColor: Colors.white,
          bottom: const TabBar(
            isScrollable: true,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: "DESAYUNO"),
              Tab(text: "ALMUERZO"),
              Tab(text: "CENA"),
              Tab(text: "BOCADILLO"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildListaAlimentos(),
            _buildListaAlimentos(),
            _buildListaAlimentos(),
            _buildListaAlimentos(),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Registro guardado correctamente")),
            );
          },
          label: const Text("GUARDAR REGISTRO"),
          icon: const Icon(Icons.save),
          backgroundColor: Colors.green[700],
        ),
      ),
    );
  }

  Widget _buildListaAlimentos() {
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: alimentos.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 5),
          child: ListTile(
            title: Text(alimentos[index]["nombre"]),
            subtitle: Text("${alimentos[index]["calorias"]} kcal"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.remove_circle_outline,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    setState(() {
                      if (alimentos[index]["cantidad"] > 0)
                        alimentos[index]["cantidad"]--;
                    });
                  },
                ),
                Text(
                  alimentos[index]["cantidad"].toString(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.add_circle_outline,
                    color: Colors.green,
                  ),
                  onPressed: () {
                    setState(() {
                      alimentos[index]["cantidad"]++;
                    });
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
