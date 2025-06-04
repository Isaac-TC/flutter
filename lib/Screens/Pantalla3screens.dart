import 'package:flutter/material.dart';

class Pantalla3 extends StatelessWidget {
  const Pantalla3({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _edadController = TextEditingController();
    final TextEditingController _experienciaController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text("Pantalla 3 - Evaluación de Aspirante")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Formulario de Evaluación", style: TextStyle(fontSize: 20)),
            SizedBox(height: 16),

            // Edad
            TextField(
              controller: _edadController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Edad",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12),

            // Años de experiencia
            TextField(
              controller: _experienciaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Años de experiencia laboral",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

            // Botón Evaluar
            ElevatedButton(
              onPressed: () {
                final edad = int.tryParse(_edadController.text);
                final experiencia = int.tryParse(_experienciaController.text);

                if (edad == null || experiencia == null) {
                  mostrarResultado(context,
                      "Completa todos los campos correctamente.");
                  return;
                }

                final esApto = edad >= 25 && edad <= 35 && experiencia >= 3;

                if (esApto) {
                  mostrarResultado(context,
                      "El aspirante puede ser seleccionado para una entrevista.");
                } else {
                  mostrarResultado(context,
                      "Lo siento, el aspirante no cumple con los requisitos para la entrevista.");
                }
              },
              child: Text("Evaluar"),
            ),
          ],
        ),
      ),
    );
  }

  void mostrarResultado(BuildContext context, String mensaje) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Resultado"),
        content: Text(mensaje),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cerrar"),
          ),
        ],
      ),
    );
  }
}
