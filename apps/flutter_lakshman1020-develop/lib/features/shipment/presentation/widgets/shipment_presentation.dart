import 'package:flutter/material.dart';
import 'package:flutter_lakshman1020/core/constants/app_colors.dart';
import 'package:get/get.dart';


import '../controllers/shipment_controller.dart';

class ShipmentPagination extends StatelessWidget {
  const ShipmentPagination({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ShipmentController>();
    
    return Obx(() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Previous button (<)
        IconButton(
          icon: const Icon(Icons.chevron_left, size: 24),
          onPressed: controller.currentPage.value > 1
              ? () => controller.changePage(controller.currentPage.value - 1)
              : null,
          style: IconButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: const Size(32, 32),
          ),
        ),
        const SizedBox(width: 8),
        
        // Page 1
        _buildPageButton(1, controller),
        const SizedBox(width: 8),
        
        // Page 2
        _buildPageButton(2, controller),
        const SizedBox(width: 8),
        
        // Dots (...)
        const Text(
          '...',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        const SizedBox(width: 8),
        
        // Page 17
        _buildPageButton(17, controller),
        const SizedBox(width: 8),
        
        // Next button (>)
        IconButton(
          icon: const Icon(Icons.chevron_right, size: 24),
          onPressed: controller.currentPage.value < controller.totalPages.value
              ? () => controller.changePage(controller.currentPage.value + 1)
              : null,
          style: IconButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: const Size(32, 32),
          ),
        ),
      ],
    ));
  }

  Widget _buildPageButton(int page, ShipmentController controller) {
    final isCurrent = page == controller.currentPage.value;
    
    return GestureDetector(
      onTap: () => controller.changePage(page),
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: isCurrent ? TColors.driverNavigation : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isCurrent ? TColors.driverNavigation : Colors.grey.shade300,
            width: 1.0,
          ),
        ),
        child: Center(
          child: Text(
            page.toString(),
            style: TextStyle(
              color: isCurrent ? TColors.white : Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}