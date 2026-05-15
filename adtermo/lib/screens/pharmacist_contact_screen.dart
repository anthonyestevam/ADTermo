import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_colors.dart';

class PharmacistContactScreen extends StatelessWidget {
  const PharmacistContactScreen({super.key});

  final String phoneNumber = '5599999999999';

  Future<void> _openWhatsApp() async {
    final Uri url = Uri.parse(
      'https://wa.me/$phoneNumber?text=Olá, gostaria de falar com um farmacêutico.',
    );

    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Não foi possível abrir o WhatsApp');
    }
  }

  Future<void> _callPhone() async {
    final Uri url = Uri.parse('tel:+$phoneNumber');

    if (!await launchUrl(url)) {
      throw Exception('Não foi possível realizar a ligação');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Fale com o Farmacêutico'),
        backgroundColor: AppColors.babyBlue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(22),
        child: Column(
          children: [
            const SizedBox(height: 10),

            const Icon(
              Icons.support_agent,
              size: 120,
              color: AppColors.darkBlue,
            ),

            const SizedBox(height: 20),

            const Text(
              'Fale com seu Farmacêutico',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),

            const SizedBox(height: 12),

            const Text(
              'Dúvidas sobre sua medicação?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Entre em contato para receber orientação sobre o uso correto e seguro do medicamento.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                height: 1.4,
                color: AppColors.textDark,
              ),
            ),

            const SizedBox(height: 28),

            _ContactCard(
              icon: Icons.chat,
              title: 'WhatsApp',
              description:
                  'Envie uma mensagem e tire suas dúvidas de forma rápida e segura.',
              buttonText: 'Enviar mensagem no WhatsApp',
              onTap: _openWhatsApp,
            ),

            const SizedBox(height: 18),

            _ContactCard(
              icon: Icons.phone,
              title: 'Telefone / Ligar',
              description:
                  'Prefere falar diretamente? Ligue para atendimento farmacêutico.',
              buttonText: 'Ligar agora',
              onTap: _callPhone,
            ),

            const SizedBox(height: 18),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: AppColors.lightRed,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Row(
                children: [
                  Icon(Icons.info, color: AppColors.red),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Em caso de emergência, procure imediatamente atendimento médico ou serviço de saúde.',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.textDark,
                      ),
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

class _ContactCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final String buttonText;
  final VoidCallback onTap;

  const _ContactCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 46,
                color: AppColors.darkBlue,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 15,
                        color: AppColors.textDark,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.darkBlue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                buttonText,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}