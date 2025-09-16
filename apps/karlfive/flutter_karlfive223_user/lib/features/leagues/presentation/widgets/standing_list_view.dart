import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../data/models/standing_model.dart';
import 'standing_row_tile.dart';

class StandingListView extends StatelessWidget {
  final List<StandingRowModel> rows;
  const StandingListView({super.key, required this.rows});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _header(),
        const SizedBox(height: 8),
        ...rows.asMap().entries.map((e) {
          final idx = e.key;
          final row = e.value;
          final stripe = idx == 0
              ? Colors.green
              : (idx >= rows.length - 2 ? Colors.red : Colors.transparent);
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: StandingRowTile(row: row, stripeColor: stripe),
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
        ),
      ),
    );
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.textFieldBackground,
        border: Border.all(color: AppColors.textFieldBorder),
      ),
      child: Row(
        children: [
          const SizedBox(width: 6),
          const SizedBox(
            width: 20,
            child: Text('Pos', style: TextStyle(color: AppColors.gray)),
          ),
          const SizedBox(width: 8 + 16 + 8),
          const Expanded(
            child: Text('Team', style: TextStyle(color: AppColors.gray)),
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
