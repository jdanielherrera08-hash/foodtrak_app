import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscurePassword = true;
  bool rememberMe = false;

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6FBF7),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),

          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,

                children: [
                  // LOGO
                  const Icon(
                    Icons.restaurant_menu,
                    size: 100,
                    color: Color(0xFF6FBF73),
                  ),

                  const SizedBox(height: 20),

                  // TITULO
                  const Text(
                    "Bienvenido a FoodTrack",

                    textAlign: TextAlign.center,

                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "Tu alimentación, tu mejor versión",

                    textAlign: TextAlign.center,

                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),

                  const SizedBox(height: 40),

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

                  const SizedBox(height: 10),

                  // RECORDAR SESION
                  Row(
                    children: [
                      Checkbox(
                        value: rememberMe,

                        activeColor: const Color(0xFF6FBF73),

                        onChanged: (value) {
                          setState(() {
                            rememberMe = value!;
                          });
                        },
                      ),

                      const Text("Recordarme"),
                    ],
                  ),

                  // OLVIDASTE CONTRASEÑA
                  Align(
                    alignment: Alignment.centerRight,

                    child: TextButton(
                      onPressed: () {},

                      child: const Text(
                        "¿Olvidaste tu contraseña?",

                        style: TextStyle(color: Color(0xFF6FBF73)),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // BOTON LOGIN
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
                      "Iniciar Sesión",

                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // REGISTER
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      const Text("¿No tienes cuenta?"),

                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/register');
                        },

                        child: const Text(
                          "Regístrate",

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
      ),
    );
  }
}
