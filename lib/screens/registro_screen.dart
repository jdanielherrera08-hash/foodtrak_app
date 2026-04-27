import 'package:flutter/material.dart';

class RegistroScreen extends StatefulWidget {
  const RegistroScreen({super.key});

  @override
  State<RegistroScreen> createState() => _RegistroScreenState();
}

class _RegistroScreenState extends State<RegistroScreen> {
  final Color greenPrimary = const Color(0xFF8A9A5B);
  final Color sandBackground = const Color(0xFFF2E8D3);
  final Color orangeAccent = const Color(0xFFFF7043);

  String comidaSeleccionada = "Desayuno";
  final TextEditingController _searchController = TextEditingController();

  // LISTA COMPLETA DE ALIMENTOS INTEGRADA
  final List<Map<String, dynamic>> catalogoAlimentos = [
    // PROTEÍNAS Y LÁCTEOS
    {
      "nombre": "Leche",
      "detalle": "100ml",
      "cal": 64,
      "macros": "P: 3.2g | G: 3.5g | C: 5g",
    },
    {
      "nombre": "Huevo",
      "detalle": "100g",
      "cal": 155,
      "macros": "P: 13g | G: 11g | C: 1g",
    },
    {
      "nombre": "Carne de res",
      "detalle": "100g",
      "cal": 250,
      "macros": "P: 26g | G: 15g | C: 0g",
    },
    {
      "nombre": "Pollo",
      "detalle": "100g",
      "cal": 180,
      "macros": "P: 27g | G: 8g | C: 0g",
    },
    {
      "nombre": "Pechuga de pollo",
      "detalle": "100g",
      "cal": 158,
      "macros": "P: 31g | G: 3.6g | C: 0g",
    },
    {
      "nombre": "Atún",
      "detalle": "100g",
      "cal": 129,
      "macros": "P: 30g | G: 1g | C: 0g",
    },
    {
      "nombre": "Salmón",
      "detalle": "100g",
      "cal": 197,
      "macros": "P: 20g | G: 13g | C: 0g",
    },
    {
      "nombre": "Camarón",
      "detalle": "100g",
      "cal": 99,
      "macros": "P: 24g | G: 0.3g | C: 0g",
    },
    {
      "nombre": "Yogurt griego",
      "detalle": "100g",
      "cal": 101,
      "macros": "P: 10g | G: 5g | C: 4g",
    },
    {
      "nombre": "Queso",
      "detalle": "100g",
      "cal": 401,
      "macros": "P: 25g | G: 33g | C: 1g",
    },
    // CARBOHIDRATOS
    {
      "nombre": "Arroz blanco",
      "detalle": "100g",
      "cal": 126,
      "macros": "P: 2.7g | G: 0.3g | C: 28g",
    },
    {
      "nombre": "Avena",
      "detalle": "100g",
      "cal": 395,
      "macros": "P: 17g | G: 7g | C: 66g",
    },
    {
      "nombre": "Cereal",
      "detalle": "100g",
      "cal": 366,
      "macros": "P: 7g | G: 2g | C: 80g",
    },
    {
      "nombre": "Pan blanco",
      "detalle": "100g",
      "cal": 259,
      "macros": "P: 9g | G: 3g | C: 49g",
    },
    {
      "nombre": "Pan integral",
      "detalle": "100g",
      "cal": 252,
      "macros": "P: 13g | G: 4g | C: 41g",
    },
    {
      "nombre": "Tortilla de maíz",
      "detalle": "100g",
      "cal": 213,
      "macros": "P: 6g | G: 1g | C: 45g",
    },
    {
      "nombre": "Tortilla de harina",
      "detalle": "100g",
      "cal": 322,
      "macros": "P: 8g | G: 10g | C: 50g",
    },
    {
      "nombre": "Pasta",
      "detalle": "100g",
      "cal": 129,
      "macros": "P: 5g | G: 1g | C: 25g",
    },
    {
      "nombre": "Frijoles",
      "detalle": "100g",
      "cal": 132,
      "macros": "P: 9g | G: 0.5g | C: 23g",
    },
    {
      "nombre": "Lentejas",
      "detalle": "100g",
      "cal": 120,
      "macros": "P: 9g | G: 0.4g | C: 20g",
    },
    // FRUTAS
    {
      "nombre": "Manzana",
      "detalle": "100g",
      "cal": 59,
      "macros": "P: 0.3g | G: 0.2g | C: 14g",
    },
    {
      "nombre": "Plátano",
      "detalle": "100g",
      "cal": 99,
      "macros": "P: 1g | G: 0.3g | C: 23g",
    },
    {
      "nombre": "Naranja",
      "detalle": "100g",
      "cal": 54,
      "macros": "P: 1g | G: 0.2g | C: 12g",
    },
    {
      "nombre": "Fresa",
      "detalle": "100g",
      "cal": 38,
      "macros": "P: 0.7g | G: 0.3g | C: 8g",
    },
    {
      "nombre": "Mango",
      "detalle": "100g",
      "cal": 67,
      "macros": "P: 0.8g | G: 0.4g | C: 15g",
    },
    {
      "nombre": "Piña",
      "detalle": "100g",
      "cal": 55,
      "macros": "P: 0.5g | G: 0.1g | C: 13g",
    },
    {
      "nombre": "Sandía",
      "detalle": "100g",
      "cal": 36,
      "macros": "P: 0.6g | G: 0.2g | C: 8g",
    },
    {
      "nombre": "Papaya",
      "detalle": "100g",
      "cal": 49,
      "macros": "P: 0.5g | G: 0.3g | C: 11g",
    },
    {
      "nombre": "Uvas",
      "detalle": "100g",
      "cal": 70,
      "macros": "P: 0.6g | G: 0.4g | C: 17g",
    },
    {
      "nombre": "Pera",
      "detalle": "100g",
      "cal": 63,
      "macros": "P: 0.4g | G: 0.1g | C: 15g",
    },
    {
      "nombre": "Durazno",
      "detalle": "100g",
      "cal": 46,
      "macros": "P: 0.9g | G: 0.3g | C: 10g",
    },
    {
      "nombre": "Kiwi",
      "detalle": "100g",
      "cal": 69,
      "macros": "P: 1.1g | G: 0.5g | C: 15g",
    },
    // VERDURAS
    {
      "nombre": "Brócoli",
      "detalle": "100g",
      "cal": 43,
      "macros": "P: 2.8g | G: 0.4g | C: 7g",
    },
    {
      "nombre": "Zanahoria",
      "detalle": "100g",
      "cal": 45,
      "macros": "P: 0.9g | G: 0.2g | C: 10g",
    },
    {
      "nombre": "Espinaca",
      "detalle": "100g",
      "cal": 30,
      "macros": "P: 2.9g | G: 0.4g | C: 3.6g",
    },
    {
      "nombre": "Lechuga",
      "detalle": "100g",
      "cal": 18,
      "macros": "P: 1g | G: 0.2g | C: 3g",
    },
    {
      "nombre": "Pepino",
      "detalle": "100g",
      "cal": 20,
      "macros": "P: 0.7g | G: 0.1g | C: 4g",
    },
    {
      "nombre": "Jitomate",
      "detalle": "100g",
      "cal": 26,
      "macros": "P: 1g | G: 0.2g | C: 5g",
    },
    {
      "nombre": "Cebolla",
      "detalle": "100g",
      "cal": 41,
      "macros": "P: 1g | G: 0.1g | C: 9g",
    },
    {
      "nombre": "Papa",
      "detalle": "100g",
      "cal": 77,
      "macros": "P: 2g | G: 0.1g | C: 17g",
    },
    {
      "nombre": "Camote",
      "detalle": "100g",
      "cal": 87,
      "macros": "P: 1.6g | G: 0.1g | C: 20g",
    },
    {
      "nombre": "Calabacita",
      "detalle": "100g",
      "cal": 20,
      "macros": "P: 1.2g | G: 0.3g | C: 3g",
    },
    // GRASAS
    {
      "nombre": "Aguacate",
      "detalle": "100g",
      "cal": 179,
      "macros": "P: 2g | G: 15g | C: 9g",
    },
    {
      "nombre": "Aceite de oliva",
      "detalle": "100g",
      "cal": 900,
      "macros": "P: 0g | G: 100g | C: 0g",
    },
    {
      "nombre": "Mantequilla",
      "detalle": "100g",
      "cal": 733,
      "macros": "P: 1g | G: 81g | C: 0g",
    },
    {
      "nombre": "Almendras",
      "detalle": "100g",
      "cal": 622,
      "macros": "P: 21g | G: 50g | C: 22g",
    },
    {
      "nombre": "Nueces",
      "detalle": "100g",
      "cal": 701,
      "macros": "P: 15g | G: 65g | C: 14g",
    },
    {
      "nombre": "Cacahuate",
      "detalle": "100g",
      "cal": 609,
      "macros": "P: 26g | G: 49g | C: 16g",
    },
  ];

  List<Map<String, dynamic>> alimentosAgregados = [];
  List<Map<String, dynamic>> resultadosBusqueda = [];

  @override
  void initState() {
    super.initState();
    resultadosBusqueda = catalogoAlimentos;
  }

  void _filtrarBusqueda(String query) {
    setState(() {
      resultadosBusqueda = catalogoAlimentos
          .where(
            (alimento) =>
                alimento["nombre"].toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    });
  }

  void _agregarAlDia(Map<String, dynamic> alimento) {
    setState(() {
      var nuevoItem = Map<String, dynamic>.from(alimento);
      nuevoItem["tipo"] = comidaSeleccionada;
      alimentosAgregados.add(nuevoItem);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("${alimento['nombre']} agregado a $comidaSeleccionada"),
        duration: const Duration(milliseconds: 800),
        backgroundColor: greenPrimary,
      ),
    );
  }

  double _getCaloriasPorTipo(String tipo) {
    return alimentosAgregados
        .where((item) => item["tipo"] == tipo)
        .fold(0, (sum, item) => sum + item["cal"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: sandBackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 60),
            Center(
              child: Text(
                "Registro de Alimentos",
                style: TextStyle(
                  color: greenPrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // 1. SELECTOR DE TIPO (DESAYUNO, ALMUERZO, ETC)
            _buildFloatingIsland(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildFoodTypeBtn("Desayuno", Icons.coffee_outlined),
                  _buildFoodTypeBtn("Almuerzo", Icons.wb_sunny_outlined),
                  _buildFoodTypeBtn("Cena", Icons.dark_mode_outlined),
                  _buildFoodTypeBtn("Bocadillo", Icons.cookie_outlined),
                ],
              ),
            ),

            // 2. BUSCADOR Y RESULTADOS
            _buildFloatingIsland(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Buscar alimentos",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _searchController,
                    onChanged: _filtrarBusqueda,
                    decoration: InputDecoration(
                      hintText: "Escribe para buscar...",
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 250,
                    child: ListView.builder(
                      itemCount: resultadosBusqueda.length,
                      itemBuilder: (context, index) {
                        final item = resultadosBusqueda[index];
                        return ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(item["nombre"]),
                          subtitle: Text(
                            "${item["cal"]} kcal | ${item["macros"]}",
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.add_circle,
                              color: greenPrimary,
                              size: 28,
                            ),
                            onPressed: () => _agregarAlDia(item),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            // 3. RESUMEN DE HOY
            _buildFloatingIsland(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Resumen de Hoy",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      _buildResumenMiniCard(
                        "Desayuno",
                        _getCaloriasPorTipo("Desayuno").toInt().toString(),
                      ),
                      _buildResumenMiniCard(
                        "Almuerzo",
                        _getCaloriasPorTipo("Almuerzo").toInt().toString(),
                      ),
                      _buildResumenMiniCard(
                        "Cena",
                        _getCaloriasPorTipo("Cena").toInt().toString(),
                      ),
                      _buildResumenMiniCard(
                        "Bocadillo",
                        _getCaloriasPorTipo("Bocadillo").toInt().toString(),
                      ),
                    ],
                  ),
                  const Divider(height: 30),
                  if (alimentosAgregados.isEmpty)
                    const Center(
                      child: Text(
                        "No has agregado alimentos aún",
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    )
                  else
                    ...alimentosAgregados.reversed
                        .map((item) => _buildItemConsumido(item))
                        .toList(),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // --- WIDGETS AUXILIARES ---
  Widget _buildFloatingIsland({required Widget child}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: child,
    );
  }

  Widget _buildFoodTypeBtn(String label, IconData icon) {
    bool isSelected = comidaSeleccionada == label;
    return GestureDetector(
      onTap: () => setState(() => comidaSeleccionada = label),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isSelected
                  ? orangeAccent.withOpacity(0.1)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: isSelected ? orangeAccent : Colors.grey[200]!,
              ),
            ),
            child: Icon(
              icon,
              color: isSelected ? orangeAccent : Colors.grey[400],
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: isSelected ? orangeAccent : Colors.grey,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResumenMiniCard(String titulo, String cal) {
    return Expanded(
      child: Column(
        children: [
          Text(titulo, style: const TextStyle(fontSize: 9, color: Colors.grey)),
          Text(
            cal,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const Text("kcal", style: TextStyle(fontSize: 8, color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildItemConsumido(Map<String, dynamic> item) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 40,
            decoration: BoxDecoration(
              color: greenPrimary,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item["nombre"],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "${item['tipo']} • ${item['macros']}",
                  style: const TextStyle(fontSize: 10, color: Colors.grey),
                ),
              ],
            ),
          ),
          Text(
            "${item['cal']} kcal",
            style: TextStyle(color: orangeAccent, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
