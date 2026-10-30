//NAVBAR DO APP

import 'package:flutter/material.dart';
import ' home_screen.dart';
import 'menu_screen.dart';
import 'search_screen.dart'; 
import 'notifications_screen.dart';
import '../register/register_screen.dart';
import '../alerts/alert_config_screen.dart';

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _currentIndex = 1; // começa em "Início"

  // Uma tela por aba, na mesma ordem dos itens da barra.
  final List<Widget> _pages = const [
    //AlertConfigScreen(),
    MenuScreen(),
    HomeScreen(),  
    SearchScreen(),   
    RegisterScreen(),
    NotificationsScreen(),  

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,   // obrigatório com 4+ itens
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF1B5E75),
        unselectedItemColor: Colors.black87,
        selectedFontSize: 11,
        unselectedFontSize: 11,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Início'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Buscar'),
          BottomNavigationBarItem(icon: Icon(Icons.build_outlined), label: 'Registros'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_none), label: 'Notificações'),
        ],
      ),
    );
  }
}