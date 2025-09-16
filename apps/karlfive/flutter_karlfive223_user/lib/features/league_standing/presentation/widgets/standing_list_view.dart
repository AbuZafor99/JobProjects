import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../data/models/standing_row_model.dart';
import 'standing_row_tile.dart';

class StandingListView extends StatelessWidget {
  final List<StandingRowModel> rows;
  const StandingListView({super.key, required this.rows});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _header(),
        const SizedBox(height: 0), // Removed spacing between header and rows
        ...rows.asMap().entries.map((e) {
          final idx = e.key;
          final row = e.value;
          // Set stripe colors based on position
          // Green for top 4 positions (Premier League Playoff)
          // Red for bottom 3 positions (Relegation Playoff)
          // Transparent for others
          final stripe = idx < 4
              ? Colors.green
              : (idx >= rows.length - 3 ? Colors.red : Colors.transparent);
          
          // Add alternating row colors
          final bgColor = idx % 2 == 0 ? Colors.white.withOpacity(0.05) : Colors.black;
          
          // Add a divider after every row
          return Column(
            children: [
              StandingRowTile(row: row, stripeColor: stripe, backgroundColor: bgColor),
              // Add a divider after each row except the last one
              if (idx < rows.length - 1)
                const Divider(height: 1, color: Colors.white24),
            ],
          );
        }),
      ],
    );
  }

  Widget _header() {
    Widget cell(String t, {double w = 26}) => SizedBox(
      width: w,
      child: Text(
        t,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: AppColors.gray,
          fontWeight: FontWeight.w600,
          fontSize: 13,
        ),
      ),
    );
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.textFieldBorder),
        ),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 30,
            child: Text(
              'Pos',
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.gray, fontSize: 13),
            ),
          ),
          const SizedBox(width: 8),
          const Expanded(
            child: Text('Team', style: TextStyle(color: AppColors.gray, fontSize: 13)),
          ),
          cell('P'),
          cell('W'),
          cell('D'),
          cell('L'),
          cell('+/-'),
          cell('PTS'),
        ],
      ),
    );
  }
}
