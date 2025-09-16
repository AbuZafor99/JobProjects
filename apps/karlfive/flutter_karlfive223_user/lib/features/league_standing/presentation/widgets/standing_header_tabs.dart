import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class StandingHeaderTabs extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int>? onChanged;
  const StandingHeaderTabs({super.key, this.currentIndex = 0, this.onChanged});

  @override
  Widget build(BuildContext context) {
    final items = const ['Standing', 'Matches', 'Teams', 'Fixtures'];
    return Row(
      children: List.generate(items.length, (index) {
        final selected = index == currentIndex;
        return Padding(
          padding: const EdgeInsets.only(right: 12),
          child: GestureDetector(
            onTap: () => onChanged?.call(index),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: selected
                    ? AppColors.textFieldBackground
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: selected
                      ? AppColors.primaryGreen
                      : AppColors.textFieldBorder,
                ),
              ),
              child: Text(
                items[index],
                style: TextStyle(
                  color: AppColors.white.withOpacity(selected ? 1 : 0.8),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
