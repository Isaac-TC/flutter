import 'package:flutter/material.dart';

class Pantalla2 extends StatelessWidget {
  const Pantalla2({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _promedioController = TextEditingController();
    final TextEditingController _ingresoController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text("Pantalla 2 - Beca Universitaria")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Formulario para beca", style: TextStyle(fontSize: 20)),
            SizedBox(height: 16),

            // Promedio
            TextField(
              controller: _promedioController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Promedio de calificaciones",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12),

            // Ingreso mensual familiar
            TextField(
              controller: _ingresoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Ingreso mensual familiar (\$)",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

            // Botón Evaluar
            ElevatedButton(
              onPressed: () {
                final promedio = double.tryParse(_promedioController.text);
                final ingreso = double.tryParse(_ingresoController.text);

                if (promedio == null || ingreso == null) {
                  mostrarResultado(context,
                      "Por favor, completa todos los campos correctamente.");
                  return;
                }

                final esElegible = promedio >= 9 && ingreso < 3000;

                if (esElegible) {
                  mostrarResultado(context,
                      "El estudiante es elegible para la beca.");
                } else {
                  mostrarResultado(context,
                      "Lo siento, el estudiante no es elegible para la beca.");
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
