import 'package:flutter/material.dart';

import '../home/home_shell.dart';

class SignupConfirmation extends StatelessWidget {
  final String email;
  final String phone;

  const SignupConfirmation({
    super.key,
    required this.email,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5FBE8),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Ícone de check verde
                const Icon(
                  Icons.check_circle,
                  color: Color(0xFF3F9B5A),
                  size: 80,
                ),
                const SizedBox(height: 40),

                // Título
                const Text(
                  'Selfie capturada.\nSeu cadastro foi finalizado.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),

                // Email e telefone
                Text('Email: $email', style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                const SizedBox(
                  width: 240,
                  child: Divider(color: Colors.black26, height: 1),
                ),
                const SizedBox(height: 8),
                Text('Telefone: $phone', style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 32),

                // Avatar oval (placeholder, depois entra a selfie real)
                ClipOval(
                  child: Container(
                    width: 120,
                    height: 160,
                    color: const Color(0xFF9EA3A5),
                    child: const Icon(
                      Icons.person,
                      size: 90,
                      color: Color(0xFFE5E5E5),
                    ),
                  ),
                ),
                const SizedBox(height: 32),

                // Botão final
                ElevatedButton(
                  onPressed: () {
                    //navega para a pagina de home
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeShell(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.from(
                      alpha: 1,
                      red: 25 / 255,
                      green: 118 / 255,
                      blue: 210 / 255,
                    ),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Clique aqui para utilizar no Dash Control',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
