//TELA MENU APP

import 'package:flutter/material.dart';

import '../alerts/alert_config_screen.dart';
import '../support/support_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
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
              padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Text(
                'Menu Inicial',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            // Navega para outra tela → seta ">"
            const _MenuLink(
              icon: Icons.settings_outlined,
              label: 'Configurações Gerais',
            ),

            // Expande aqui mesmo → seta "v"
            const _MenuExpandable(
              icon: Icons.people_outline,
              label: 'Contas',
              children: [_SubItem('Migração de conta')],
            ),
            
            const _MenuExpandable(
              icon: Icons.error_outline,
              label: 'Alerta',
              children: [
                _SubItem('Configuração de Alerta', screen: AlertConfigScreen()),
              ],
            ),

            const _MenuLink(
              icon: Icons.bolt_outlined,
              label: 'Instâncias',
              fontSize: 17,
            ),

            
            const _MenuLink(
              icon: Icons.help_outline,
              label: 'Suporte',
              fontSize: 17,
              screen: SupportScreen(),
              
            ),

            const SizedBox(height: 16),
            ListTile(
              dense: true,
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text(
                'Sair',
                style: TextStyle(color: Colors.red, fontSize: 18),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _SubItem {
  final String label;
  final Widget? screen;

  const _SubItem(this.label, {this.screen});
}

// Item que leva a outra tela (seta ">")
class _MenuLink extends StatelessWidget {
  final IconData icon;
  final String label;
  final double fontSize;
  final Widget? screen;

  const _MenuLink({
    required this.icon,
    required this.label,
    this.fontSize = 17,
    this.screen,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          dense: true,
          leading: Icon(icon, color: Colors.black87),
          title: Text(label, style: TextStyle(fontSize: fontSize)),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            if (screen != null) {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => screen!),
              );
            }
          },
        ),
        const Divider(height: 1),
      ],
    );
  }
}

// Item com subitens (seta "v" que gira para "^")
class _MenuExpandable extends StatelessWidget {
  final IconData icon;
  final String label;
  final List<_SubItem> children;

  const _MenuExpandable({
    required this.icon,
    required this.label,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Theme(
          // remove as linhas extras que o ExpansionTile desenha ao abrir
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            leading: Icon(icon, color: Colors.black87),
            title: Text(label, style: const TextStyle(fontSize: 17)),
            childrenPadding: const EdgeInsets.only(left: 10),
            children: children
                .map(
                  (sub) => ListTile(
                    dense: true,
                    //text - descricao submenu
                    title: Text(
                      sub.label,
                      style: const TextStyle(fontSize: 16),
                    ),
                    //trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      if (sub.screen != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => sub.screen!),
                        );
                      }
                    },
                  ),
                )
                .toList(),
          ),
        ),
        const Divider(height: 1),
      ],
    );
  }
}
