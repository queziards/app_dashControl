import 'package:dascontrol_mobile/signup/signup_confirmation.dart';
import 'package:flutter/material.dart';


class PhoneVerification extends StatefulWidget {
  final String phone; // ← recebe o telefone da tela anterior

  const PhoneVerification({super.key, required this.phone});

  @override
  State<PhoneVerification> createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(24, 70, 24, 40),
              decoration: const BoxDecoration(
                color: Color(0xFF0E5E6F),
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(0)),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 12),
                  Text(
                    'Obrigado, email confirmado!',
                    style: TextStyle(
                      fontSize: 20,
                       color: Colors.white,
                       fontWeight: FontWeight.bold,
                      ),
                  ),
                  Text(
                    'Agora enviamos um novo código via SMS para seu telefone:1199999-9999',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      height: 1.4,
                      
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
            const Text(
              'Digite o código de verificação enviado',
              style: TextStyle(fontSize: 19),
            ),
            const SizedBox(height: 16),

            // Os 5 quadradinhos de código
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, // ← era .spaceBetween
              children: List.generate(5, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                  ), // espaço entre os quadradinhos
                  child: SizedBox(
                    width: 50,
                    child: TextField(
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      decoration: InputDecoration(
                        counterText: '',
                        filled: true, // fundo cinza claro, como no Figma
                        fillColor: const Color(0xFFF5F5F5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),

            const SizedBox(height: 16),
            const Text(
              'Não recebeu o código? Clique aqui para enviarmos outro.',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: () {
                // lógica de reenviar código
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignupConfirmation(
                    email: 'example@gmail.com',
                    phone: '11999999999',
                  ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: const Color.from(alpha: 1, red: 25 / 255, green: 118 / 255, blue: 210 / 255),),
              child: const Text(
                'Novo código',
                style: TextStyle(fontSize: 17, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
