import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class StandingLegend extends StatelessWidget {
  const StandingLegend({super.key});

  @override
  Widget build(BuildContext context) {
    Widget item(Color color, String text) => Row(
      children: [
        Container(width: 3, height: 22, color: color),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text, 
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );

    // TEMPORARY COMMENT: This is the legend section that matches the design image
    // Should be deleted when real data is implemented
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Key:', 
            style: TextStyle(
              color: AppColors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          // TEMPORARY COMMENT: Updated legend to match the design
        // Top 4 teams qualify for Premier League Playoff
        item(Colors.green, 'Premier League Playoff (Top 4)'),
        const SizedBox(height: 12),
        // Bottom 3 teams face relegation
        item(Colors.red, 'Relegation Playoff (Bottom 3)'),
        ],
      ),
    );
  }
}
