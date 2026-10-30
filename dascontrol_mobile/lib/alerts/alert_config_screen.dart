import 'package:flutter/material.dart';

class AlertConfigScreen extends StatefulWidget {
  const AlertConfigScreen({super.key});

  @override
  State<AlertConfigScreen> createState() => _AlertConfigScreenState();
}

class _AlertConfigScreenState extends State<AlertConfigScreen> {
  int _currentIndex = 0; // Índice da aba ativa

  final List<_AlertItem> _alerts = [
    _AlertItem(
      name: 'Alerta 1',
      recurrence: '5 minutos',
      period: '8×5',
      groups: const [
        AlertGroup(name: 'Grupo 1', instances: ['Instâncias 1', 'Instâncias 2']),
        AlertGroup(name: 'Sem grupo', instances: ['Instâncias 1']),
      ],
    ),
    _AlertItem(
      name: 'Alerta 2',
      recurrence: '10 minutos',
      period: 'Dias úteis',
      groups: const [
        AlertGroup(name: 'Grupo 2', instances: ['Instâncias 1', 'Instâncias 2']),
        AlertGroup(name: 'Sem grupo', instances: ['Instâncias 1']),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // FAIXA COLORIDA NO TOPO COM TÍTULO E ORIENTAÇÃO
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(
              20,
              MediaQuery.of(context).padding.top + 24,
              20,
              28,
            ),
            decoration: const BoxDecoration(
              color: Color(0xFF1F5F75),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(28)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Configuração de Alerta',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  'Use o botão abaixo para ativar ou desativar o alarme do ambiente.',
                  style: TextStyle(
                    color: Color(0xFFE6F1F5),
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          // LISTA DE CARDS EXPANSÍVEIS
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
              itemCount: _alerts.length,
              separatorBuilder: (_, __) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                final alert = _alerts[index];
                return _AlertCard(
                  alert: alert,
                  onChanged: (value) => setState(() => alert.active = value),
                );
              },
            ),
          ),
        ],
      ),

      // BARRA DE NAVEGAÇÃO INFERIOR
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF1F5F75),
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

// ---------------------------------------------------------------------------
// Modelos de Dados
// ---------------------------------------------------------------------------

class AlertGroup {
  const AlertGroup({required this.name, required this.instances});
  final String name;
  final List<String> instances;
}

class _AlertItem {
  _AlertItem({
    required this.name,
    required this.recurrence,
    required this.period,
    required this.groups,
    this.active = true,
    this.isExpanded = false,
  });

  final String name;
  final String recurrence;
  final String period;
  final List<AlertGroup> groups;
  bool active;
  bool isExpanded;
}

// ---------------------------------------------------------------------------
// Card de Alerta com Expansão Embutida
// ---------------------------------------------------------------------------

class _AlertCard extends StatefulWidget {
  const _AlertCard({
    required this.alert,
    required this.onChanged,
  });

  final _AlertItem alert;
  final ValueChanged<bool> onChanged;

  @override
  State<_AlertCard> createState() => _AlertCardState();
}

class _AlertCardState extends State<_AlertCard> {
  static const _ink = Color(0xFF111827);
  static const _muted = Color(0xFF6B7280);
  static const _green = Color(0xFF22C55E);
  static const _greenDark = Color(0xFF15803D);

  @override
  Widget build(BuildContext context) {
    final on = widget.alert.active;
    final expanded = widget.alert.isExpanded;

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 200),
      opacity: on ? 1.0 : 0.5, // Esmaeceu o card quando desativado
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFFE5E7EB)),
          boxShadow: const [
            BoxShadow(color: Color(0x0A101828), blurRadius: 2, offset: Offset(0, 1)),
            BoxShadow(color: Color(0x0F101828), blurRadius: 24, offset: Offset(0, 8)),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cabeçalho Clicável
            InkWell(
              onTap: () {
                setState(() {
                  widget.alert.isExpanded = !widget.alert.isExpanded;
                });
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 12, 16),
                child: Row(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: on
                            ? const Color(0xFFDCFCE7)
                            : const Color(0xFFF3F4F6),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.notifications_none_rounded,
                        color: on ? _greenDark : _muted,
                        size: 22,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'NOME DO ALERTA',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.7,
                              color: _muted,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            widget.alert.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: _ink,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(
                                expanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                                size: 14,
                                color: const Color(0xFF1F5F75),
                              ),
                              const SizedBox(width: 2),
                              Text(
                                expanded ? 'Ocultar detalhes' : 'Ver mais detalhes',
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Color(0xFF1F5F75),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Text(
                      on ? 'Ativo' : 'Inativo',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: on ? _greenDark : _muted,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Switch(
                      value: on,
                      onChanged: widget.onChanged,
                      thumbColor: const WidgetStatePropertyAll(Colors.white),
                      trackColor: WidgetStateProperty.resolveWith(
                        (states) => states.contains(WidgetState.selected)
                            ? _green
                            : const Color(0xFFD1D5DB),
                      ),
                      trackOutlineColor:
                          const WidgetStatePropertyAll(Colors.transparent),
                    ),
                  ],
                ),
              ),
            ),

            // Detalhes Expansíveis
            if (expanded) ...[
              const Divider(height: 1, thickness: 1, color: Color(0xFFEEF0F3)),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildDetailRow('Recorrência:', widget.alert.recurrence),
                    const SizedBox(height: 8),
                    _buildDetailRow('Período:', widget.alert.period),
                    const SizedBox(height: 8),
                    const Text(
                      'Grupo/Instâncias:',
                      style: TextStyle(fontWeight: FontWeight.bold, color: _ink, fontSize: 14),
                    ),
                    const SizedBox(height: 4),
                    ...widget.alert.groups.map((group) => Padding(
                          padding: const EdgeInsets.only(left: 8, bottom: 4),
                          child: Text(
                            '• ${group.name}: ${group.instances.join(", ")}',
                            style: const TextStyle(color: _muted, fontSize: 14),
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: Color(0xFF6B7280), fontSize: 14)),
        Text(value, style: const TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF111827), fontSize: 14)),
      ],
    );
  }
}