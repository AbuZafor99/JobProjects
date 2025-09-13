import 'package:flutter/material.dart';
import 'package:flutter_lakshman1020/core/constants/app_colors.dart';
import 'package:flutter_lakshman1020/features/shipment/models/shipment_model.dart';


class ShipmentItem extends StatelessWidget {
  final ShipmentModel shipment;

  const ShipmentItem({
    super.key,
    required this.shipment,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: TColors.white,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: TColors.personalBackground, width: 2.0),
      ),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: TColors.grey2,
          child: Icon(Icons.inventory_2, color: Colors.white),
        ),
        title: Text(
          shipment.loadNumber,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(shipment.description),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _truncateText(shipment.origin, 12),
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            Text(
              _truncateText(shipment.destination, 12),
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  String _truncateText(String text, int maxLength) {
    if (text.length <= maxLength) return text;
    return '${text.substring(0, maxLength)}...';
  }
}