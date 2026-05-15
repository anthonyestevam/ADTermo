import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class LogoHeader extends StatelessWidget {
  const LogoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(
          Icons.health_and_safety_outlined,
          size: 70,
          color: AppColors.darkBlue,
        ),
        RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'Ad',
                style: TextStyle(
                  color: AppColors.darkBlue,
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: 'Termo',
                style: TextStyle(
                  color: AppColors.red,
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          'Instruções para variações de temperatura\nem medicamentos termolábeis',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14, color: AppColors.textDark),
        ),
      ],
    );
  }
}