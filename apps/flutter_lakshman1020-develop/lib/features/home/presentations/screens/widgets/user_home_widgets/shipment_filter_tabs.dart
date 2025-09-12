import 'package:flutter/material.dart';
import 'package:flutter_lakshman1020/core/constants/app_colors.dart';

class ShipmentFilterTabs extends StatefulWidget {
  const ShipmentFilterTabs({super.key});

  @override
  State<ShipmentFilterTabs> createState() => _ShipmentFilterTabsState();
}

class _ShipmentFilterTabsState extends State<ShipmentFilterTabs> {
  int selectedIndex = 0;
  final filters = ["All", "Pending", "Processing", "Delivered"];

@override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(filters.length, (index) {
        final isSelected = index == selectedIndex;

        return Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 2.0),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected ? TColors.driverNavigation : TColors.white,
                  borderRadius: isSelected
                      ? BorderRadius.circular(20)
                      : BorderRadius.circular(4),
                  border: Border.all(
                    color: TColors.driverNavigation,
                    width: 2.0,
                  ),
                ),
                child: Text(
                  filters[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: isSelected
                        ? TColors.activityColor
                        : TColors.activityColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
