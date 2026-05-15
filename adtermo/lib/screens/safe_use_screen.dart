import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'pharmacist_contact_screen.dart';

class SafeUseScreen extends StatefulWidget {
  const SafeUseScreen({super.key});

  @override
  State<SafeUseScreen> createState() => _SafeUseScreenState();
}

class _SafeUseScreenState extends State<SafeUseScreen> {
  int currentPage = 0;
  final PageController _pageController = PageController();

  final List<_SafeUseItem> items = const [
    _SafeUseItem(
      title: 'Se seguro',
      subtitle: 'O farmacêutico libera o uso, mas orienta',
      icon: Icons.verified_user,
      iconColor: AppColors.darkBlue,
      description:
          'Quando o uso do medicamento estiver seguro, o farmacêutico libera, mas sempre orienta o paciente sobre como usar corretamente.',
      alertTitle: 'Orientação é essencial',
      alertText:
          'Explique ao paciente a dose correta, os horários e os cuidados necessários para o uso seguro do medicamento.',
    ),
    _SafeUseItem(
      title: 'Se inseguro',
      subtitle: 'O descarte deve ser feito em postos de coleta',
      icon: Icons.warning_amber_rounded,
      iconColor: AppColors.red,
      description:
          'Se o uso do medicamento não for seguro, o descarte deve ser feito em pontos de coleta apropriados, farmácias ou postos de saúde.',
      alertTitle: 'Nunca jogue no lixo comum ou no esgoto',
      alertText:
          'Isso pode causar riscos à saúde humana, aos animais e ao meio ambiente.',
    ),
  ];

  void nextPage() {
    if (currentPage < items.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const PharmacistContactScreen(),
        ),
      );
    }
  }

  void previousPage() {
    if (currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Uso seguro'),
        backgroundColor: AppColors.babyBlue,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: previousPage,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: items.length,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                final item = items[index];

                return SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.gray,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            'Tópico ${index + 1} de ${items.length}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: AppColors.textDark,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 28),

                      Icon(
                        item.icon,
                        size: 120,
                        color: item.iconColor,
                      ),

                      const SizedBox(height: 28),

                      Text(
                        '${index + 1}. ${item.title}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textDark,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Text(
                        item.subtitle,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textDark,
                        ),
                      ),

                      const SizedBox(height: 18),

                      Text(
                        item.description,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          height: 1.4,
                          color: AppColors.textDark,
                        ),
                      ),

                      const SizedBox(height: 28),

                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.lightRed,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              index == 0 ? Icons.info : Icons.warning,
                              color: AppColors.red,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.alertTitle,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.textDark,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    item.alertText,
                                    style: const TextStyle(
                                      color: AppColors.textDark,
                                      height: 1.35,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              items.length,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: currentPage == index ? 18 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color:
                      currentPage == index ? AppColors.red : Colors.grey[300],
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: nextPage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.darkBlue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  currentPage == items.length - 1
                      ? 'Falar com farmacêutico'
                      : 'Próximo tópico',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class _SafeUseItem {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconColor;
  final String description;
  final String alertTitle;
  final String alertText;

  const _SafeUseItem({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconColor,
    required this.description,
    required this.alertTitle,
    required this.alertText,
  });
}