import 'package:flutter/material.dart';
import 'problem_details_screen.dart';

class _Problema {
  final String id;
  final String nome;
  final String descricao;
  final String hora;
  final String data;
  final String evento;
  final String detalhe;

  const _Problema({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.hora,
    required this.data,
    required this.evento,
    required this.detalhe,
  });
}

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  static const Color _accent = Color(0xFF1F5F75);
  static const Color _bg = Color(0xFFF3F6F8);
  static const Color _textMain = Color(0xFF12202B);
  static const Color _textSoft = Color(0xFF3F505D);
  static const Color _textMuted = Color(0xFF52626F);
  static const Color _danger = Color(0xFFB42318);
  static const Color _dangerBg = Color(0xFFFDEBEA);

  // Dados de exemplo. Troque pela sua lista real quando tiver.
  static const List<_Problema> _problemas = [
    _Problema(
      id: '0121',
      nome: 'Instância - 1',
      descricao: 'Indisponível by MP Ping',
      hora: '10:14',
      data: '11.08.2025',
      evento: 'ip(177.129.210/exemplo(190.090.09.012)',
      detalhe:
          'As últimas três tentativas retornaram o tempo limite. Verifique a conectividade do dispositivo.',
    ),
    _Problema(
      id: '0122',
      nome: 'Instância - 2',
      descricao: 'Indisponível',
      hora: '13:50',
      data: '12.08.2025',
      evento: 'ip(177.129.210/exemplo(190.090.09.012)',
      detalhe:
          'As últimas três tentativas retornaram o tempo limite. Verifique a conectividade do dispositivo.',
    ),
    _Problema(
      id: '0123',
      nome: 'Instância - 3',
      descricao: 'Indisponível',
      hora: '00:09',
      data: '24.08.2025',
      evento: 'ip(177.129.210/exemplo(190.090.09.012)',
      detalhe:
          'As últimas três tentativas retornaram o tempo limite. Verifique a conectividade do dispositivo.',
    ),
    _Problema(
      id: '0124',
      nome: 'Instância - 4',
      descricao: 'Indisponível',
      hora: '15:36',
      data: '01.09.2025',
      evento: 'ip(177.129.210/exemplo(190.090.09.012)',
      detalhe:
          'As últimas três tentativas retornaram o tempo limite. Verifique a conectividade do dispositivo.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      body: Column(
        children: [
          _buildHeader(context),
          _buildFilters(),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
              itemCount: _problemas.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, i) => _ProblemaCard(
                problema: _problemas[i],
                onTap: () {
                  final p = _problemas[i];
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProblemDetailsScreen(
                        id: p.id,
                        nome: p.nome,
                        evento: p.evento,
                        descricao: p.detalhe,
                        hora: p.hora,
                        data: p.data,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
        20,
        MediaQuery.of(context).padding.top + 24,
        20,
        28,
      ),
      decoration: const BoxDecoration(
        color: _accent,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(28)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Problemas Recentes',
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            '${_problemas.length} alertas precisam de atenção',
            style: const TextStyle(
              color: Color(0xFFE6F1F5),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilters() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 6),
      child: Row(
        children: [
          _chip('Todos · ${_problemas.length}', selected: true),
          const SizedBox(width: 8),
          _chip('Erro'),
          const SizedBox(width: 8),
          _chip('Hoje'),
        ],
      ),
    );
  }

  Widget _chip(String label, {bool selected = false}) {
    return Container(
      height: 36,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: selected ? _accent : Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: selected ? null : Border.all(color: const Color(0xFFD5DDE3)),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 13,
          fontWeight: selected ? FontWeight.w700 : FontWeight.w600,
          color: selected ? Colors.white : _textSoft,
        ),
      ),
    );
  }
}

class _ProblemaCard extends StatelessWidget {
  final _Problema problema;
  final VoidCallback onTap;

  const _ProblemaCard({required this.problema, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0F101828),
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
          BoxShadow(
            color: Color(0x0D101828),
            blurRadius: 16,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(18),
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              children: [
                Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    color: RegisterScreen._dangerBg,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Icon(
                    Icons.warning_amber_rounded,
                    color: Color(0xFFC62828),
                    size: 24,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        problema.nome,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: RegisterScreen._textMain,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        problema.descricao,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: RegisterScreen._textSoft,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: RegisterScreen._dangerBg,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Text(
                              'ERRO',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 0.5,
                                color: RegisterScreen._danger,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '${problema.hora} · ${problema.data}',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: RegisterScreen._textMuted,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.chevron_right_rounded,
                  color: Color(0xFF8796A3),
                  size: 24,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}