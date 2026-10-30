// Tela de BOAS-VINDAS
import 'package:flutter/material.dart';
import 'email_verification.dart'; // ← import da próxima tela

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // Controllers guardam o texto digitado em cada campo
  final _emailController = TextEditingController();
  final _nomeController = TextEditingController();
  final _telefoneController = TextEditingController();

  @override
  void dispose() {
    // Libera os controllers quando a tela é fechada, para não vazar memória
    _emailController.dispose();
    _nomeController.dispose();
    _telefoneController.dispose();
    super.dispose();
  }

  void _continuar() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EmailVerification(email: _emailController.text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: SingleChildScrollView(
        child: Column(
          children: [


            // Faixa colorida do topo, com o texto de boas-vindas
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(24, 70, 24, 40),
              decoration: const BoxDecoration(
                color: Color(0xFF0E5E6F),
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bem-vindo!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Faça seu cadastro e comece a usar o Dash Control para cuidar da sua infraestrutura de um jeito simples.',
                    style: TextStyle(color: Colors.white, fontSize: 18, height: 1.4),
                  ),
                ],
              ),
            ),

            // Cartão branco com o formulário
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Email:', style: TextStyle(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 6),
                  TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: 'example@gmail.com',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),

                  const Text('Nome completo:', style: TextStyle(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 6),
                  TextField(
                    controller: _nomeController,
                    decoration: const InputDecoration(
                      hintText: 'João Silva',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),

                  const Text('Telefone:', style: TextStyle(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 6),
                  TextField(
                    controller: _telefoneController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      hintText: '(55)11989999999',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 24),

                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.from(alpha: 1, red: 25 / 255, green: 118 / 255, blue: 210 / 255),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: _continuar,
                      child: const Text(
                        'Continuar',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  const Center(
                    child: Text(
                      'Ao me cadastrar eu aceito os termos de uso e política de privacidade.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}