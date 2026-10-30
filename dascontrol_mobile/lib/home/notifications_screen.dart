//notificacoes

import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  // Dados fixos de exemplo (depois virão do back-end).
  // Deixe a lista vazia ( [] ) para ver o estado "Nenhuma notificação".
  static const List<Map<String, dynamic>> _notifications = [
    {
      'time': 'Há 1 hora',
      'message': 'Você foi adicionado como colaborador com permissões definidas.',
      'unread': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Faixa azul do topo com o título
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(24, 60, 24, 20),
            color: const Color(0xFF1B5E75),
            child: const Text(
              'Notificações',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Expanded(
            child: _notifications.isEmpty
                ? const _EmptyState()
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: _notifications.length,
                    itemBuilder: (context, index) {
                      final n = _notifications[index];
                      return _NotificationItem(
                        time: n['time'] as String,
                        message: n['message'] as String,
                        unread: n['unread'] as bool,
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

// Estado vazio: cartão "Nenhuma notificação"
class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFCFDDE3),
            border: Border.all(color: const Color(0xFF1B5E75)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Row(
            children: [
              Icon(Icons.sentiment_neutral, color: Color(0xFF1B5E75)),
              SizedBox(width: 8),
              Text(
                'Nenhuma notificação',
                style: TextStyle(
                  color: Color(0xFF1B5E75),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Item da lista: horário, mensagem e ponto vermelho se não lida
class _NotificationItem extends StatelessWidget {
  final String time;
  final String message;
  final bool unread;

  const _NotificationItem({
    required this.time,
    required this.message,
    required this.unread,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F7F7),
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  time,
                  style: const TextStyle(fontSize: 11, color: Colors.grey),
                ),
                const SizedBox(height: 4),
                Text(message, style: const TextStyle(fontSize: 14)),
              ],
            ),
          ),
          if (unread)
            const Padding(
              padding: EdgeInsets.only(left: 8, top: 4),
              child: Icon(Icons.circle, size: 10, color: Colors.red),
            ),
        ],
      ),
    );
  }
}

