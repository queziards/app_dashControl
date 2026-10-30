
//TELA INICIAL DO APP 

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const List<Map<String, dynamic>> _instances = [
    {'name': 'Instância 1', 'color': Color(0xFF1C9D5C)},
    {'name': 'Instância 2', 'color': Color(0xFFF5B82E)},
    {'name': 'Instância 3', 'color': Color(0xFFE53935)},
    {'name': 'Instância 4', 'color': Color(0xFF1C9D5C)},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 110,
              color: const Color(0xFF1B5E75),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  //CircleAvatar(radius: 18, backgroundColor: Color(0xFFD9603B)),
                  Spacer(),
                  Text(
                    'Seja bem vindo, João',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(24, 16, 24, 8),
              child: Text(
                'Instâncias - Grupo X',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black26),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: _instances
                      .map((i) => InstanceItem(
                            name: i['name'] as String,
                            statusColor: i['color'] as Color,
                          ))
                      .toList(),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

// Item da lista: guarda se está expandido ou não
class InstanceItem extends StatefulWidget {
  final String name;
  final Color statusColor;

  const InstanceItem({
    super.key,
    required this.name,
    required this.statusColor,
  });

  @override
  State<InstanceItem> createState() => _InstanceItemState();
}

class _InstanceItemState extends State<InstanceItem> {
  bool _expanded = false; // ← o "estado" do item

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => setState(() => _expanded = !_expanded),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            child: Row(
              children: [
                Icon(Icons.circle, size: 14, color: widget.statusColor),
                const SizedBox(width: 8),
                Text(widget.name, style: const TextStyle(fontSize: 16)),
                const Spacer(),
                Icon(
                  _expanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ),
        if (_expanded)
          Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              children: const [
                ActionButton(
                    label: 'Reiniciar',
                    icon: Icons.sync,
                    iconColor: Color(0xFF1B5E75)),
                ActionButton(
                    label: 'Ligar',
                    icon: Icons.power_settings_new,
                    iconColor: Color(0xFF1C9D5C)),
                ActionButton(
                    label: 'Desligar',
                    icon: Icons.power_settings_new,
                    iconColor: Color(0xFFE53935)),
                ActionButton(
                    label: 'Console',
                    icon: Icons.terminal,
                    iconColor: Color(0xFF1B5E75)),
              ],
            ),
          ),
      ],
    );
  }
}

// Botão de ação (Reiniciar, Ligar, Desligar, Console)
class ActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color iconColor;

  const ActionButton({
    super.key,
    required this.label,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 2),
      child: Material(
        color: const Color(0xFFCFDDE3),
        borderRadius: BorderRadius.circular(2),
        child: InkWell(
          onTap: () {
            // TODO: ação real entra na integração com o back-end
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    color: Color(0xFF1B5E75),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Icon(icon, color: iconColor, size: 22),
              ],
            ),
          ),
        ),
      ),
    );
  }
}