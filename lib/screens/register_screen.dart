import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  String selectedGoal = "Bajar peso";

  final List<String> goals = [
    "Bajar peso",
    "Mantener peso",
    "Ganar masa muscular",
    "Comer saludable",
  ];

  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController ageController = TextEditingController();

  final TextEditingController weightController = TextEditingController();

  final TextEditingController heightController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6FBF7),

      appBar: AppBar(
        backgroundColor: const Color(0xFFF6FBF7),
        elevation: 0,

        iconTheme: const IconThemeData(color: Colors.black),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),

          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,

              children: [
                // ICONO
                const Icon(
                  Icons.person_add_alt_1,
                  size: 90,
                  color: Color(0xFF6FBF73),
                ),

                const SizedBox(height: 20),

                // TITULO
                const Text(
                  "Crear Cuenta",
                  textAlign: TextAlign.center,

                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Completa tus datos para comenzar",
                  textAlign: TextAlign.center,

                  style: TextStyle(color: Colors.grey),
                ),

                const SizedBox(height: 35),

                // NOMBRE
                TextField(
                  controller: nameController,

                  decoration: InputDecoration(
                    labelText: "Nombre completo",

                    prefixIcon: const Icon(Icons.person_outline),

                    filled: true,
                    fillColor: Colors.white,

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),

                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // EMAIL
                TextField(
                  controller: emailController,

                  decoration: InputDecoration(
                    labelText: "Correo electrónico",

                    prefixIcon: const Icon(Icons.email_outlined),

                    filled: true,
                    fillColor: Colors.white,

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),

                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // EDAD
                TextField(
                  controller: ageController,
                  keyboardType: TextInputType.number,

                  decoration: InputDecoration(
                    labelText: "Edad",

                    prefixIcon: const Icon(Icons.cake_outlined),

                    filled: true,
                    fillColor: Colors.white,

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),

                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // PESO
                TextField(
                  controller: weightController,
                  keyboardType: TextInputType.number,

                  decoration: InputDecoration(
                    labelText: "Peso (kg)",

                    prefixIcon: const Icon(Icons.monitor_weight_outlined),

                    filled: true,
                    fillColor: Colors.white,

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),

                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // ALTURA
                TextField(
                  controller: heightController,
                  keyboardType: TextInputType.number,

                  decoration: InputDecoration(
                    labelText: "Altura (cm)",

                    prefixIcon: const Icon(Icons.height),

                    filled: true,
                    fillColor: Colors.white,

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),

                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // OBJETIVO
                DropdownButtonFormField(
                  value: selectedGoal,

                  decoration: InputDecoration(
                    labelText: "Objetivo",

                    prefixIcon: const Icon(Icons.flag_outlined),

                    filled: true,
                    fillColor: Colors.white,

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),

                      borderSide: BorderSide.none,
                    ),
                  ),

                  items: goals.map((goal) {
                    return DropdownMenuItem(value: goal, child: Text(goal));
                  }).toList(),

                  onChanged: (value) {
                    setState(() {
                      selectedGoal = value!;
                    });
                  },
                ),

                const SizedBox(height: 20),

                // PASSWORD
                TextField(
                  controller: passwordController,

                  obscureText: obscurePassword,

                  decoration: InputDecoration(
                    labelText: "Contraseña",

                    prefixIcon: const Icon(Icons.lock_outline),

                    suffixIcon: IconButton(
                      icon: Icon(
                        obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),

                      onPressed: () {
                        setState(() {
                          obscurePassword = !obscurePassword;
                        });
                      },
                    ),

                    filled: true,
                    fillColor: Colors.white,

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),

                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // CONFIRM PASSWORD
                TextField(
                  controller: confirmPasswordController,

                  obscureText: obscureConfirmPassword,

                  decoration: InputDecoration(
                    labelText: "Confirmar contraseña",

                    prefixIcon: const Icon(Icons.lock_outline),

                    suffixIcon: IconButton(
                      icon: Icon(
                        obscureConfirmPassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),

                      onPressed: () {
                        setState(() {
                          obscureConfirmPassword = !obscureConfirmPassword;
                        });
                      },
                    ),

                    filled: true,
                    fillColor: Colors.white,

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),

                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 35),

                // BOTON
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/home');
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6FBF73),

                    padding: const EdgeInsets.symmetric(vertical: 16),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),

                  child: const Text(
                    "Crear Cuenta",

                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),

                const SizedBox(height: 20),

                // LOGIN
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    const Text("¿Ya tienes cuenta?"),

                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },

                      child: const Text(
                        "Inicia sesión",

                        style: TextStyle(
                          color: Color(0xFF6FBF73),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
