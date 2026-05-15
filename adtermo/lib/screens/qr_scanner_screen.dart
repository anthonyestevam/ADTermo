import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../data/medication_data.dart';
import '../theme/app_colors.dart';
import 'medication_screen.dart';

class QrScannerScreen extends StatefulWidget {
  const QrScannerScreen({super.key});

  @override
  State<QrScannerScreen> createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen> {
  bool scanned = false;

  void _handleQrCode(String? value) {
    if (value == null || scanned) return;

    final qrText = value.trim().toLowerCase();

    final medication = medications[qrText];

    setState(() {
      scanned = true;
    });

    if (medication == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Medicamento não encontrado: $value'),
          backgroundColor: AppColors.red,
        ),
      );

      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          setState(() {
            scanned = false;
          });
        }
      });

      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => MedicationScreen(
          medication: medication,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        title: const Text('Ler QR Code'),
        backgroundColor: AppColors.babyBlue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      body: Stack(
        children: [

          MobileScanner(
            onDetect: (capture) {
              final barcode = capture.barcodes.first;
              _handleQrCode(barcode.rawValue);
            },
          ),

          Center(
            child: Container(
              width: 260,
              height: 260,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 4,
                ),
                borderRadius: BorderRadius.circular(24),
              ),
            ),
          ),

          Positioned(
            top: 50,
            left: 24,
            right: 24,
            child: Column(
              children: [
                const Icon(
                  Icons.qr_code_scanner,
                  color: Colors.white,
                  size: 55,
                ),

                const SizedBox(height: 14),

                const Text(
                  'Posicione o QR Code dentro da área de leitura',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  'O aplicativo identificará automaticamente o medicamento.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.85),
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),

          const Positioned(
            bottom: 45,
            left: 24,
            right: 24,
            child: Text(
              'Aponte a câmera para o QR Code do medicamento.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}