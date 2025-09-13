import 'package:flutter_lakshman1020/features/shipment/models/shipment_model.dart';
import 'package:get/get.dart';


class ShipmentController extends GetxController {
  var shipments = <ShipmentModel>[].obs;
  var isLoading = true.obs;
  var currentFilter = 'All'.obs;
  var currentPage = 1.obs;
  var totalPages = 17.obs;

  final List<String> filters = ["All", "Pending", "Processing", "Delivered"];

  @override
  void onInit() {
    super.onInit();
    loadShipments();
  }

  // Simulate API call to get shipments
  Future<void> loadShipments() async {
    try {
      isLoading.value = true;
      
      // Simulate API delay
      await Future.delayed(const Duration(seconds: 1));
      
      // Demo data matching the screenshot
      final demoShipments = [
        ShipmentModel(
          id: '1',
          loadNumber: '#load_45982',
          description: 'Medical equipment for students',
          origin: 'Chicago, IL',
          destination: 'Indianapolis, IN',
          status: 'processing',
          createdAt: DateTime.now().subtract(const Duration(days: 1)),
        ),
        ShipmentModel(
          id: '2',
          loadNumber: '#load_45982',
          description: 'Medical equipment for students',
          origin: 'Chicago, IL',
          destination: 'Indianapolis, IN',
          status: 'pending',
          createdAt: DateTime.now().subtract(const Duration(days: 2)),
        ),
        ShipmentModel(
          id: '3',
          loadNumber: '#load_45982',
          description: 'Medical equipment for students',
          origin: 'Chicago, IL',
          destination: 'Indianapolis, IN',
          status: 'processing',
          createdAt: DateTime.now().subtract(const Duration(days: 3)),
        ),
        ShipmentModel(
          id: '4',
          loadNumber: '#load_45982',
          description: 'Medical equipment for students',
          origin: 'New York, NY',
          destination: 'Indianapolis, IN',
          status: 'delivered',
          createdAt: DateTime.now().subtract(const Duration(days: 4)),
        ),
        ShipmentModel(
          id: '5',
          loadNumber: '#load_45982',
          description: 'Medical equipment for students',
          origin: 'Boston, MA',
          destination: 'Indianapolis, IN',
          status: 'pending',
          createdAt: DateTime.now().subtract(const Duration(days: 5)),
        ),
        ShipmentModel(
          id: '6',
          loadNumber: '#load_45982',
          description: 'Medical equipment for students',
          origin: 'Louisville, KY',
          destination: 'Indianapolis, IN',
          status: 'processing',
          createdAt: DateTime.now().subtract(const Duration(days: 6)),
        ),
        ShipmentModel(
          id: '7',
          loadNumber: '#load_45982',
          description: 'Medical equipment for students',
          origin: 'Phoenix, AZ',
          destination: 'Indianapolis, IN',
          status: 'delivered',
          createdAt: DateTime.now().subtract(const Duration(days: 7)),
        ),
      ];
      
      shipments.assignAll(demoShipments);
    } catch (e) {
      Get.snackbar('Error', 'Failed to load shipments');
    } finally {
      isLoading.value = false;
    }
  }

  void changeFilter(String filter) {
    currentFilter.value = filter;
    // In real app, this would trigger an API call with the filter
    loadShipments();
  }

  void changePage(int page) {
    currentPage.value = page;
    // In real app, this would trigger an API call for the specific page
    loadShipments();
  }

  // Filter shipments based on current selection
  List<ShipmentModel> get filteredShipments {
    if (currentFilter.value == 'All') {
      return shipments;
    }
    return shipments.where((shipment) => shipment.status == currentFilter.value.toLowerCase()).toList();
  }

  // Refresh shipments
  Future<void> refreshShipments() async {
    await loadShipments();
  }
}