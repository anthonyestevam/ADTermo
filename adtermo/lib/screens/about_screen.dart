import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/bottom_nav.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNav(currentIndex: 1),
      appBar: AppBar(
        title: const Text('Como funciona'),
        backgroundColor: AppColors.red,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Como usar o AdTermo',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: AppColors.darkBlue,
              ),
            ),
            SizedBox(height: 20),
            Text(
              '1. Verifique se o medicamento apresentou ALERTA VERMELHO no sensor de temperatura.\n\n'
              '2. Selecione o termolábil ou toque em “Ler QR Code”.\n\n'
              '3. Aponte a câmera para o QR Code do medicamento.\n\n'
              '4. O aplicativo mostrará a faixa de temperatura recomendada, passo a passo de conduta, uso seguro e contato para conversar com o farmacêutico via Whatsapp ou Ligação.\n\n'
              '5. As orientações devem ser confirmadas pelo farmacêutico ou responsável técnico.',
              style: TextStyle(fontSize: 17, height: 1.5),
            ),
            SizedBox(height: 24),
            Text(
              'Importante',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.red,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'O app funciona offline e não substitui avaliação técnica, bula, fabricante ou protocolo institucional.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      ),
    );
  }
}