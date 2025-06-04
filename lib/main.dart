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

    );
  }
}