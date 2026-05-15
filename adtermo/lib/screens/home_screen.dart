import 'package:flutter/material.dart';
import '../data/medication_data.dart';
import '../models/medication.dart';
import '../theme/app_colors.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/logo_header.dart';
import 'medication_screen.dart';
import 'qr_scanner_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _openMedication(BuildContext context, String key) {
    final Medication? medication = medications[key];

    if (medication == null) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => MedicationScreen(medication: medication),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNav(currentIndex: 0),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(22, 20, 22, 20),
          child: Column(
            children: [
              const LogoHeader(),

              const SizedBox(height: 28),

              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error, color: AppColors.babyBlue, size: 34),
                  SizedBox(width: 10),
                  Text(
                    'ALERTA VERMELHO',
                    style: TextStyle(
                      color: AppColors.red,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              const Text(
                'Selecione o medicamento termolábil ou leia o QR Code para saber como agir em caso de variação de temperatura.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  color: AppColors.textDark,
                  height: 1.35,
                ),
              ),

              const SizedBox(height: 28),

              SizedBox(
                height: 390,
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 285,
                      height: 285,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.red.withOpacity(0.25),
                          width: 2,
                        ),
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const QrScannerScreen(),
                          ),
                        );
                      },
                      child: Container(
                        width: 145,
                        height: 145,
                        decoration: BoxDecoration(
                        color: AppColors.babyBlue,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.babyBlue.withOpacity(0.35),
                              blurRadius: 20,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.qr_code_scanner,
                              color: Colors.white,
                              size: 42,
                            ),
                            SizedBox(height: 8),
                            Text(
                              'LER\nQR CODE',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    _MedicineCircleButton(
                      top: 15,
                      left: 100,
                      title: 'INSULINA',
                      icon: Icons.medication_liquid,
                      onTap: () => _openMedication(context, 'insulina'),
                      ),

                    _MedicineCircleButton(
                      top: 70,
                      right: -10,
                      title: 'VACINA',
                      icon: Icons.vaccines,
                      onTap: () => _openMedication(context, 'vacina'),
                      ),

                    _MedicineCircleButton(
                      top: 175,
                      right: -30,
                      title: 'AMPOLA',
                      icon: Icons.science,
                      onTap: () => _openMedication(context, 'ampola'),
                      ),

                    _MedicineCircleButton(
                      bottom: 30,
                      right: 35,
                      title: 'HEMODERIVADOS',
                      icon: Icons.bloodtype,
                      onTap: () => _openMedication(context, 'hemoderivados'),
                      ),

                    _MedicineCircleButton(
                      bottom: 30,
                      left: 35,
                      title: 'ANTICORPOS',
                      icon: Icons.biotech,
                      onTap: () => _openMedication(context, 'anticorpos monoclonais'),
                      ),

                    _MedicineCircleButton(
                      top: 175,
                      left: -30,
                      title: 'HORMÔNIOS',
                      icon: Icons.bubble_chart,
                      onTap: () => _openMedication(context, 'hormonios'),
                      ),

                    _MedicineCircleButton(
                      top: 70,
                      left: -10,
                      title: 'ANTIBIÓTICO',
                      icon: Icons.medical_services,
                      onTap: () => _openMedication(context, 'antibiotico injetavel'),
                      ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.lightRed,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.info, color: AppColors.red),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Este aplicativo deve ser utilizado apenas quando o medicamento apresentar ALERTA VERMELHO no sensor de temperatura.',
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
      ),
    );
  }
}

class _MedicineCircleButton extends StatelessWidget {
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const _MedicineCircleButton({
    this.top,
    this.bottom,
    this.left,
    this.right,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 90,
          height: 90,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.12),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
            border: Border.all(
              color: Colors.grey.withOpacity(0.15),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: AppColors.darkBlue,
                size: 27,
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                    height: 1.1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}