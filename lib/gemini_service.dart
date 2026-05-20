import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiService {
  // Tu API Key del proyecto
  final String _apiKey = "AIzaSyDxh39VODduFCLElp3IOOogfUPXn4-lO2Y";

  Future<String> consultarDieta(String preguntaUsuario) async {
    if (preguntaUsuario.trim().isEmpty) return "";

    try {
      // Usamos 'gemini-1.0-pro' que es el modelo real compatible con tu librería
      final model = GenerativeModel(model: 'gemini-1.0-pro', apiKey: _apiKey);

      // Le damos una instrucción clara para que responda rápido, preciso y profesional
      final prompt =
          'Eres la IA asistente de FoodTrak. Responde de forma breve, motivadora y concisa en un párrafo sobre nutrición o planes alimenticios a lo siguiente: $preguntaUsuario';

      final response = await model.generateContent([Content.text(prompt)]);

      // Si todo sale bien, regresa el texto de internet
      return response.text ??
          "No se recibió respuesta de la IA. Intenta de nuevo.";
    } catch (e) {
      // Si hay un tema de versión estricto, este segundo modelo es el respaldo oficial en internet
      try {
        final fallbackModel = GenerativeModel(
          model: 'gemini-1.0-pro-001',
          apiKey: _apiKey,
        );
        final prompt =
            'Responde brevemente sobre nutrición a: $preguntaUsuario';
        final response = await fallbackModel.generateContent([
          Content.text(prompt),
        ]);
        return response.text ?? "Sin respuesta del servidor remoto.";
      } catch (errorInterno) {
        return "Error de comunicación con la API de Google. Verifica tu conexión.";
      }
    }
  }
}
