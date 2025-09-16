import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class StandingHeaderTabs extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int>? onChanged;
  const StandingHeaderTabs({super.key, this.currentIndex = 0, this.onChanged});

  @override
  Widget build(BuildContext context) {
    final items = const ['Standing', 'Matches', 'Teams', 'Fixtures'];
    return Container(
      height: 40,
      decoration: const BoxDecoration(
        color: Colors.black38,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(items.length, (index) {
          final selected = index == currentIndex;
          return Expanded(
            child: GestureDetector(
              onTap: () => onChanged?.call(index),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: selected
                      ? const Border(
                          bottom: BorderSide(color: AppColors.primaryGreen, width: 3),
                        )
                      : null,
                ),
                child: Text(
                  items[index],
                  style: TextStyle(
                    color: selected ? AppColors.white : AppColors.gray,
                    fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
