import 'package:flutter/material.dart';

class DeliveryListItem extends StatelessWidget {
  final String driverName;
  final String deliveredDate;
  final String deliveredID;
  final bool isSelected;
  final VoidCallback onTap;

  const DeliveryListItem({
    super.key,
    required this.driverName,
    required this.deliveredDate,
    required this.deliveredID,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isSelected ? Colors.blue[50] : null,
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        title: Text(driverName),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(deliveredDate), Text(deliveredID)],
        ),
        onTap: onTap,
      ),
    );
  }
}
