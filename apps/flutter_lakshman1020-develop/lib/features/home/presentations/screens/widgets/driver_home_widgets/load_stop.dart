import 'package:flutter/material.dart';

class LoadStop extends StatelessWidget {
  final String label;
  final String location;
  final String status;
  final Color statusColor;
  final String time;

  const LoadStop({
    required this.label,
    required this.location,
    required this.status,
    required this.statusColor,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.location_on, color: Colors.red, size: 20),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 14)),
              Text(location, style: const TextStyle(fontSize: 14)),
              const SizedBox(height: 4),
              Text(time,
                  style: const TextStyle(color: Colors.black54, fontSize: 12)),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Text(
          status,
          style: TextStyle(
              color: statusColor, fontWeight: FontWeight.w500, fontSize: 13),
        ),
      ],
    );
  }
}