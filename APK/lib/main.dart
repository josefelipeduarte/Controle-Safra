import 'package:agro/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Controle Safra',
      theme: ThemeData(
        // Usando primaryColor para cor de fundo do AppBar
        primaryColor: Colors.black, // Cor principal do tema
        scaffoldBackgroundColor:
            Colors.white, // Cor de fundo para o resto do app
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black, // Cor do fundo da AppBar
          foregroundColor: Colors.white, // Cor do texto e ícones da AppBar
          elevation: 0, // Remover sombra da AppBar
        ),
      ),
      home: const MyHomePage(),
    );
  }
}
