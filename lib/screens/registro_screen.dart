import 'package:flutter/material.dart';

class RegistroScreen extends StatefulWidget {
  final Function(double kcal, double p, double c, double g) onAlimentoAgregado;

  const RegistroScreen({super.key, required this.onAlimentoAgregado});

  @override
  State<RegistroScreen> createState() => _RegistroScreenState();
}

@override
State<RegistroScreen> createState() => _RegistroScreenState();

class _RegistroScreenState extends State<RegistroScreen> {
  final Color greenPrimary = const Color(0xFF8A9A5B);
  final Color sandBackground = const Color(0xFFF2E8D3);
  final Color orangeAccent = const Color(0xFFFF7043);

  String comidaSeleccionada = "Desayuno";
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> catalogoAlimentos = [
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
      "nombre": "Licuado de plátano con avena",
      "detalle": "1 vaso (350ml)",
      "cal": 315,
      "macros": "P: 11.2g | G: 5.3g | C: 57.5g",
    },
    {
      "nombre": "Batido verde antioxidante",
      "detalle": "1 vaso (300ml)",
      "cal": 65,
      "macros": "P: 1.8g | G: 0.5g | C: 14.2g",
    },
    {
      "nombre": "Licuado de fresa con almendras",
      "detalle": "1 vaso (350ml)",
      "cal": 225,
      "macros": "P: 7.2g | G: 11.8g | C: 23.5g",
    },
    {
      "nombre": "Sándwich de pollo clásico",
      "detalle": "1 pieza",
      "cal": 340,
      "macros": "P: 28.5g | G: 9.2g | C: 36g",
    },
    {
      "nombre": "Molletes integrales con pico de gallo",
      "detalle": "2 piezas",
      "cal": 385,
      "macros": "P: 16.5g | G: 11.2g | C: 54g",
    },
    {
      "nombre": "Pechuga con arroz y verduras",
      "detalle": "1 plato (350g)",
      "cal": 425,
      "macros": "P: 38.5g | G: 6.2g | C: 54.5g",
    },
    {
      "nombre": "Tacos de guisado con nopales",
      "detalle": "3 piezas",
      "cal": 390,
      "macros": "P: 22g | G: 9.5g | C: 53g",
    },
    {
      "nombre": "Filete de pescado empapelado",
      "detalle": "1 plato (250g)",
      "cal": 245,
      "macros": "P: 26.2g | G: 5.6g | C: 21g",
    },
    {
      "nombre": "Licuado de plátano con avena",
      "detalle": "1 vaso (350ml)",
      "cal": 315,
      "macros": "P: 11.2g | G: 5.3g | C: 57.5g",
    },
    {
      "nombre": "Batido verde antioxidante",
      "detalle": "1 vaso (300ml)",
      "cal": 65,
      "macros": "P: 1.8g | G: 0.5g | C: 14.2g",
    },
    {
      "nombre": "Licuado de fresa con almendras",
      "detalle": "1 vaso (350ml)",
      "cal": 225,
      "macros": "P: 7.2g | G: 11.8g | C: 23.5g",
    },
    {
      "nombre": "Sándwich de pollo clásico",
      "detalle": "1 pieza",
      "cal": 340,
      "macros": "P: 28.5g | G: 9.2g | C: 36g",
    },
    {
      "nombre": "Molletes integrales con pico de gallo",
      "detalle": "2 piezas",
      "cal": 385,
      "macros": "P: 16.5g | G: 11.2g | C: 54g",
    },
    {
      "nombre": "Pechuga con arroz y verduras",
      "detalle": "1 plato (350g)",
      "cal": 425,
      "macros": "P: 38.5g | G: 6.2g | C: 54.5g",
    },
    {
      "nombre": "Tacos de guisado con nopales",
      "detalle": "3 piezas",
      "cal": 390,
      "macros": "P: 22g | G: 9.5g | C: 53g",
    },
    {
      "nombre": "Filete de pescado empapelado",
      "detalle": "1 plato (250g)",
      "cal": 245,
      "macros": "P: 26.2g | G: 5.6g | C: 21g",
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
      "nombre": "Queso panela",
      "detalle": "100g",
      "cal": 240,
      "macros": "P: 18g | G: 17g | C: 3g",
    },
    {
      "nombre": "Queso oaxaca / asadero",
      "detalle": "100g",
      "cal": 300,
      "macros": "P: 22g | G: 22g | C: 2g",
    },
    {
      "nombre": "Queso cheddar",
      "detalle": "100g",
      "cal": 403,
      "macros": "P: 25g | G: 33g | C: 1.3g",
    },
    {
      "nombre": "Queso crema",
      "detalle": "100g",
      "cal": 342,
      "macros": "P: 6g | G: 34g | C: 4g",
    },
    {
      "nombre": "Queso cottage",
      "detalle": "100g",
      "cal": 98,
      "macros": "P: 11g | G: 4.3g | C: 3.4g",
    },
    {
      "nombre": "Leche entera",
      "detalle": "100ml",
      "cal": 61,
      "macros": "P: 3.2g | G: 3.3g | C: 4.7g",
    },
    {
      "nombre": "Leche descremada / light",
      "detalle": "100ml",
      "cal": 35,
      "macros": "P: 3.4g | G: 0.1g | C: 4.9g",
    },
    {
      "nombre": "Leche de almendras (sin azúcar)",
      "detalle": "100ml",
      "cal": 15,
      "macros": "P: 0.5g | G: 1.1g | C: 0.3g",
    },
    {
      "nombre": "Leche de avena",
      "detalle": "100ml",
      "cal": 48,
      "macros": "P: 1g | G: 1.5g | C: 7.5g",
    },
    {
      "nombre": "Leche achocolatada",
      "detalle": "100ml",
      "cal": 80,
      "macros": "P: 3.2g | G: 2g | C: 11.5g",
    },
    {
      "nombre": "Yogurt griego natural sin azúcar",
      "detalle": "100g",
      "cal": 59,
      "macros": "P: 10g | G: 0.4g | C: 3.6g",
    },
    {
      "nombre": "Yogurt natural con azúcar",
      "detalle": "100g",
      "cal": 95,
      "macros": "P: 3.5g | G: 2.5g | C: 14g",
    },
    {
      "nombre": "Yogurt de fresa",
      "detalle": "100g",
      "cal": 102,
      "macros": "P: 3.2g | G: 2g | C: 17g",
    },
    {
      "nombre": "Yogurt para beber",
      "detalle": "1 pieza (220g)",
      "cal": 180,
      "macros": "P: 5.5g | G: 3.2g | C: 31g",
    },
    {
      "nombre": "Pizza de pepperoni",
      "detalle": "1 rebanada grande",
      "cal": 290,
      "macros": "P: 12g | G: 12g | C: 32g",
    },
    {
      "nombre": "Hamburguesa con queso clásica",
      "detalle": "1 pieza",
      "cal": 480,
      "macros": "P: 28g | G: 24g | C: 38g",
    },
    {
      "nombre": "Papas fritas",
      "detalle": "1 porción mediana (110g)",
      "cal": 365,
      "macros": "P: 4g | G: 17g | C: 48g",
    },
    {
      "nombre": "Hot dog clásico",
      "detalle": "1 pieza",
      "cal": 290,
      "macros": "P: 10g | G: 16g | C: 26g",
    },
    {
      "nombre": "Tacos al pastor",
      "detalle": "1 orden (3 tacos)",
      "cal": 450,
      "macros": "P: 24g | G: 18g | C: 42g",
    },
    {
      "nombre": "Chilaquiles con pollo y crema",
      "detalle": "1 plato (400g)",
      "cal": 620,
      "macros": "P: 28g | G: 34g | C: 51g",
    },
    {
      "nombre": "Sushi Philadelphia roll",
      "detalle": "1 rollo (10 piezas)",
      "cal": 310,
      "macros": "P: 9g | G: 8g | C: 50g",
    },
    {
      "nombre": "Boneless de pollo en salsa BBQ",
      "detalle": "1 porción (200g)",
      "cal": 510,
      "macros": "P: 32g | G: 22g | C: 44g",
    },
    {
      "nombre": "Ensalada César con pollo",
      "detalle": "1 plato grande",
      "cal": 390,
      "macros": "P: 25g | G: 26g | C: 14g",
    },
    {
      "nombre": "Refresco de cola regular",
      "detalle": "1 lata (355ml)",
      "cal": 140,
      "macros": "P: 0g | G: 0g | C: 35g",
    },
    {
      "nombre": "Papas fritas de bolsa / Sabritas",
      "detalle": "1 bolsa chica (40g)",
      "cal": 210,
      "macros": "P: 2.5g | G: 13g | C: 21g",
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

    String macros = alimento["macros"];

    double p = 0;
    double g = 0;
    double c = 0;

    try {
      p = double.parse(
        macros.split("|")[0].replaceAll("P:", "").replaceAll("g", "").trim(),
      );

      g = double.parse(
        macros.split("|")[1].replaceAll("G:", "").replaceAll("g", "").trim(),
      );

      c = double.parse(
        macros.split("|")[2].replaceAll("C:", "").replaceAll("g", "").trim(),
      );
    } catch (e) {
      p = 0;
      g = 0;
      c = 0;
    }

    widget.onAlimentoAgregado(alimento["cal"].toDouble(), p, c, g);

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

          Row(
            mainAxisSize: MainAxisSize.min,

            children: [
              Text(
                "${item['cal']} kcal",

                style: TextStyle(
                  color: orangeAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),

              IconButton(
                icon: const Icon(Icons.delete, color: Colors.red, size: 20),

                onPressed: () {
                  setState(() {
                    widget.onAlimentoAgregado(-item["cal"].toDouble(), 0, 0, 0);

                    alimentosAgregados.remove(item);
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
