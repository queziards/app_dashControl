//INICIA O APP - O main.dart só decide qual tela abre primeiro.

import 'package:flutter/material.dart';
import 'signup/signup_screen.dart'; 
import 'home/home_shell.dart';

void main() {
  runApp(const MyApp()); //incializa o app
}

class MyApp extends StatelessWidget {
  //widget - bloco da tela- formacao da tela
  const MyApp({super.key});
  
 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dash Control',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: true,
      ),
      home: const HomeShell(), //SignupScreen(),   // ← aqui importa só a tela inicial
    );
  }
}