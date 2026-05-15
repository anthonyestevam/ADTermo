import 'package:flutter/material.dart';
import '../models/medication.dart';
import '../theme/app_colors.dart';
import 'safe_use_screen.dart';

class MedicationScreen extends StatefulWidget {
  final Medication medication;

  const MedicationScreen({
    super.key,
    required this.medication,
  });

  @override
  State<MedicationScreen> createState() => _MedicationScreenState();
}

class _MedicationScreenState extends State<MedicationScreen> {
  int currentStep = 0;

  void nextStep() {
    if (currentStep < widget.medication.steps.length - 1) {
      setState(() {
        currentStep++;
      });
    }
  }

  void previousStep() {
    if (currentStep > 0) {
      setState(() {
        currentStep--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final medication = widget.medication;

    return Scaffold(
      appBar: AppBar(
        title: Text(medication.name),
        backgroundColor: AppColors.babyBlue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          children: [
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Row(
                  children: [
                    const Icon(
                      Icons.medication_liquid,
                      size: 60,
                      color: AppColors.darkBlue,
                    ),
                    const SizedBox(width: 18),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Medicamento: ${medication.name}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Faixa ideal: ${medication.idealTemperature}',
                            style: const TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 18),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: AppColors.lightRed,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const Icon(Icons.warning, color: AppColors.red, size: 36),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      '${medication.alertTitle}\n${medication.description}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            Text(
              'Passo ${currentStep + 1} de ${medication.steps.length}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.darkBlue,
              ),
            ),

            const SizedBox(height: 22),

            Image.asset(
              medication.stepIcons[currentStep],
              width: 120,
              height: 120,
              fit: BoxFit.contain,
            ),

            const SizedBox(height: 25),

            Text(
              medication.steps[currentStep],
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),

            const Spacer(),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: currentStep == 0 ? null : previousStep,
                    child: const Text('Voltar'),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: ElevatedButton(
                    onPressed: currentStep == medication.steps.length - 1
    ? () {
        Navigator.push(
          context,
          MaterialPageRoute(
          builder: (_) => const SafeUseScreen(),
          ),
        );
      }
    : nextStep,
style: ElevatedButton.styleFrom(
  backgroundColor: AppColors.darkBlue,
  foregroundColor: Colors.white,
),
child: Text(
  currentStep == medication.steps.length - 1
      ? 'Uso seguro'
      : 'Próximo passo',
),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}