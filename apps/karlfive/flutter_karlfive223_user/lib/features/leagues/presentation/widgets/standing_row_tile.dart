import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../data/models/standing_model.dart';

class StandingRowTile extends StatelessWidget {
  final StandingRowModel row;
  final Color stripeColor;
  const StandingRowTile({
    super.key,
    required this.row,
    required this.stripeColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        children: [
          Container(width: 6, color: stripeColor),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: AppColors.textFieldBackground,
                border: Border.all(color: AppColors.textFieldBorder),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                    child: Text(
                      '${row.position}',
                      style: const TextStyle(color: AppColors.white),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(
                    Icons.sports_tennis,
                    size: 16,
                    color: AppColors.white,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      row.teamName,
                      style: const TextStyle(color: AppColors.white),
                    ),
                  ),
                  _cell(row.played),
                  _cell(row.won),
                  _cell(row.draw),
                  _cell(row.lost),
                  _cell(row.goalDiff),
                  _cell(row.points),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _cell(int v) => SizedBox(
    width: 26,
    child: Text(
      '$v',
      textAlign: TextAlign.center,
      style: const TextStyle(color: AppColors.white),
    ),
  );
}
