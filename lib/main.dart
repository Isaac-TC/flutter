import 'package:flutter/material.dart';
import 'package:activida_autonoma/Screens/Pantalla1screens.dart';
import 'package:activida_autonoma/Screens/Pantalla2screens.dart';
import 'package:activida_autonoma/Screens/Pantalla3screens.dart';

void main() {
  runApp(EjerciciosApp());
}

class EjerciciosApp extends StatelessWidget {
  const EjerciciosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Cuerpo(),
    );
  }
}

class Cuerpo extends StatelessWidget {
  const Cuerpo({super.key});

  final String imageUrl =
      "https://4kwallpapers.com/images/walls/thumbs_2t/20090.jpg"; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Imagen desde la web
          Image.network(
            imageUrl,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) =>
                loadingProgress == null
                    ? child
                    : Center(child: CircularProgressIndicator()),
            errorBuilder: (context, error, stackTrace) => Center(
              child: Text("Error al cargar la imagen"),
            ),
          ),
          // Capa oscura para mejor contraste
          Container(
            color: Colors.black.withOpacity(0.4),
          ),
          // Contenido con botones
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Ejercicios",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                btnEjercicio1(context),
                SizedBox(height: 20),
                btnEjercicio2(context),
                SizedBox(height: 20),
                btnEjercicio3(context),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget btnEjercicio1(BuildContext context) {
  return FilledButton(
    onPressed: () => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Pantalla1()),
    ),
    child: Text("Pantalla 1"),
    style: ButtonStyle(
      padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 40, vertical: 15)),
      shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
      backgroundColor: WidgetStatePropertyAll(Color.fromRGBO(11, 206, 141, 1)),
    ),
  );
}

Widget btnEjercicio2(BuildContext context) {
  return FilledButton(
    onPressed: () => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Pantalla2()),
    ),
    child: Text("Pantalla 2"),
    style: ButtonStyle(
      padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 40, vertical: 15)),
      shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
      backgroundColor: WidgetStatePropertyAll(Colors.blueAccent),
    ),
  );
}

Widget btnEjercicio3(BuildContext context) {
  return FilledButton(
    onPressed: () => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Pantalla3()),
    ),
    child: Text("Pantalla 3"),
    style: ButtonStyle(
      padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 40, vertical: 15)),
      shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
      backgroundColor: WidgetStatePropertyAll(Colors.deepOrange),
    ),
  );
}
