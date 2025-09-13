import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_colors.dart';
import '../controllers/shipment_controller.dart';


class ShipmentFilterTabs extends StatelessWidget {
  const ShipmentFilterTabs({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ShipmentController>();
    
    return Obx(() => Row(
      children: List.generate(controller.filters.length, (index) {
        final filter = controller.filters[index];
        final isSelected = filter == controller.currentFilter.value;

        return Expanded(
          child: GestureDetector(
            onTap: () {
              controller.changeFilter(filter);
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
                  filter,
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
    ));
  }
}