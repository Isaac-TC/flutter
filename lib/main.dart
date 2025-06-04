import 'package:activida_autonoma/Screens/Pantalla1screens.dart';
import 'package:activida_autonoma/Screens/Pantalla2screens.dart';
import 'package:activida_autonoma/Screens/Pantalla3screens.dart';
import 'package:flutter/material.dart';

void main (){
  runApp(EjerciciosApp());
}

class EjerciciosApp extends StatelessWidget {
  const EjerciciosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Cuerpo(),
    );
  }
}

class Cuerpo extends StatelessWidget {
  const Cuerpo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ejercicios"),        
      ),
      body:Column(children: [
         btnEjercicio1(context), 
         btnEjercicio2(context),
         btnEjercicio3(context),
        
      ],)
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
      backgroundColor:
          WidgetStatePropertyAll(Color.fromRGBO(11, 206, 141, 1)),
    ),
  );
}

Widget btnEjercicio2(BuildContext context) {
  return ElevatedButton(
    onPressed: () => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Pantalla2()),
    ),
    child: Text("Pantalla 2"),
  );
}

Widget btnEjercicio3(BuildContext context) {
  return ElevatedButton(
    onPressed: () => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Pantalla3()),
    ),
    child: Text("Pantalla 3"),
  );
}