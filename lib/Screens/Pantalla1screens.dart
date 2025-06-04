import 'package:flutter/material.dart';

class Pantalla1 extends StatelessWidget {
  const Pantalla1({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _edadController = TextEditingController();
    final TextEditingController _promedioController = TextEditingController();
    final ValueNotifier<String?> _nivelIngles = ValueNotifier<String?>(null);

    return Scaffold(
      appBar: AppBar(title: Text("Pantalla 1 - Evaluación")),
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

            // Nivel de inglés
            ValueListenableBuilder<String?>(
              valueListenable: _nivelIngles,
              builder: (context, value, _) {
                return DropdownButtonFormField<String>(
                  value: value,
                  items: ["básico", "intermedio", "avanzado"]
                      .map((nivel) => DropdownMenuItem(
                            child: Text(nivel),
                            value: nivel,
                          ))
                      .toList(),
                  onChanged: (nuevoNivel) => _nivelIngles.value = nuevoNivel,
                  decoration: InputDecoration(
                    labelText: "Nivel de inglés",
                    border: OutlineInputBorder(),
                  ),
                );
              },
            ),
            SizedBox(height: 12),

            // Promedio
            TextField(
              controller: _promedioController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Promedio de calificaciones",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

            // Botón Evaluar
            ElevatedButton(
              onPressed: () {
                final edad = int.tryParse(_edadController.text);
                final promedio = double.tryParse(_promedioController.text);
                final nivel = _nivelIngles.value;

                if (edad == null || promedio == null || nivel == null) {
                  mostrarResultado(context,
                      "⚠️ Por favor completa todos los campos correctamente.");
                  return;
                }

                final esApto = edad >= 16 &&
                    edad <= 25 &&
                    (nivel == "intermedio" || nivel == "avanzado") &&
                    promedio >= 8;

                if (esApto) {
                  mostrarResultado(context,
                      " El estudiante es apto para el programa de intercambio.");
                } else {
                  mostrarResultado(context,
                      " El estudiante no cumple con los requisitos.");
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
