import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String texto;

  const CustomCard({super.key, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(padding: const EdgeInsets.all(16), child: Text(texto)),
    );
  }
}
