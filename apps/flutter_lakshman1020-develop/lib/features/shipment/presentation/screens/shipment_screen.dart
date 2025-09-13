import 'package:flutter/material.dart';
import 'package:flutter_lakshman1020/features/home/presentations/screens/widgets/user_home_widgets/shipment_filter_tabs.dart';
import 'package:flutter_lakshman1020/features/home/presentations/screens/widgets/user_home_widgets/shipment_item.dart';
import 'package:flutter_lakshman1020/features/shipment/presentation/controllers/shipment_controller.dart';
import 'package:flutter_lakshman1020/features/shipment/presentation/widgets/shipment_presentation.dart';
import 'package:get/get.dart';


class ShipmentsScreen extends StatelessWidget {
  const ShipmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ShipmentController());
    
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        title: const Text('Shipment'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Filter tabs
            const ShipmentFilterTabs(),
            const SizedBox(height: 16),
            
            // Shipments list
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                
                if (controller.filteredShipments.isEmpty) {
                  return const Center(
                    child: Text('No shipments found'),
                  );
                }
                
                return RefreshIndicator(
                  onRefresh: () async {
                    await controller.refreshShipments();
                  },
                  child: ListView.builder(
                    itemCount: controller.filteredShipments.length,
                    itemBuilder: (context, index) {
                      final shipment = controller.filteredShipments[index];
                      return ShipmentItem();//shipment:shipment
                    },
                  ),
                );
              }),
            ),
            
            // Pagination
            const SizedBox(height: 16),
            const ShipmentPagination(),
          ],
        ),
      ),
    );
  }
}