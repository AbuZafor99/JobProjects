import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../data/models/standing_row_model.dart';

class StandingRowTile extends StatelessWidget {
  final StandingRowModel row;
  final Color stripeColor;
  final Color backgroundColor;
  const StandingRowTile({
    super.key,
    required this.row,
    required this.stripeColor,
    this.backgroundColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(width: 3, color: stripeColor),
          // Removed bottom border as we're using Divider instead
        ),
        color: backgroundColor,
      ),
      child: Row(
        children: [
          // Position number
          SizedBox(
            width: 30,
            child: Text(
              '${row.position}',
              textAlign: TextAlign.center,
              style: const TextStyle(color: AppColors.white),
            ),
          ),
          // Team icon and name
          Row(
            children: [
              const SizedBox(width: 8),
              // Team logo - using CircleAvatar with black background and white icon
              // This matches the design in the image
              // Team logo - using CircleAvatar with team-specific styling
              CircleAvatar(
                radius: 12,
                backgroundColor: Colors.black,
                child: Text(
                  row.teamName.substring(0, 1),
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  row.teamName,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          // Stats
          _cell(row.played),
          _cell(row.won),
          _cell(row.draw),
          _cell(row.lost),
          _cell(row.goalDiff),
          _cell(row.points),
        ],
      ),
    );
  }

  // Custom cell widget for displaying stats
  Widget _cell(int v) => SizedBox(
    width: 26,
    child: Text(
      '$v',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: v > 0 ? AppColors.white : AppColors.white.withOpacity(0.7),
        fontSize: 13,
        fontWeight: v > 15 ? FontWeight.w600 : FontWeight.normal,
      ),
    ),
  );
}
