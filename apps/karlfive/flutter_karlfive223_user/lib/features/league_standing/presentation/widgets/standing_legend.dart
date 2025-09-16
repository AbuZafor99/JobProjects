import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class StandingLegend extends StatelessWidget {
  const StandingLegend({super.key});

  @override
  Widget build(BuildContext context) {
    Widget item(Color color, String text) => Row(
      children: [
        Container(width: 10, height: 22, color: color),
        const SizedBox(width: 8),
        Expanded(
          child: Text(text, style: const TextStyle(color: AppColors.white)),
        ),
      ],
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Key:', style: TextStyle(color: AppColors.white)),
        const SizedBox(height: 10),
        item(Colors.green, 'Premier League Playoff'),
        const SizedBox(height: 12),
        item(Colors.red, 'Relegation Playoff'),
      ],
    );
  }
}
