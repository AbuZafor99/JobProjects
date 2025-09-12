import 'package:flutter/material.dart';
import 'package:flutter_lakshman1020/core/constants/app_colors.dart';

class RecentShipmentHeader extends StatelessWidget {
  const RecentShipmentHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Recent Shipment",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Spacer(),
        TextButton(
          onPressed: () {}, // <-- Add
          child: const Text(
            "view more",
            style: TextStyle(color: TColors.primary),
          ),
        ),
      ],
    );
  }
}
