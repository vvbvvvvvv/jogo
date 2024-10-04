import 'package:flutter/material.dart';
import 'package:jogo/view/home_view.dart';

void main() {
  runApp(const MyApp()); 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adivinhe o Número', 
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), // Tema do aplicativo
        useMaterial3: true,
      ),
      home: const HomeView(), 
    );
  }
}
