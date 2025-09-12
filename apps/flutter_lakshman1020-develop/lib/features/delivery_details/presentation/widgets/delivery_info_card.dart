import 'package:flutter/material.dart';

class DeliveryInfoCard extends StatelessWidget {
  final Map<String, String> details;

  const DeliveryInfoCard({
    super.key,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    final String? title = details['title'];

    final filteredDetails = Map<String, String>.from(details)
      ..remove('title');

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (title != null) // Show title only if it exists
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          const SizedBox(height: 20), // Increased to match image spacing

          ...filteredDetails.entries.map((entry) {
            return Column(
              children: [
                _buildInfoSection(entry.key, entry.value),
                if (filteredDetails.entries.toList().indexOf(entry) <
                    filteredDetails.length - 1)
                  _buildDivider(),
              ],
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildInfoSection(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0), // Adjusted for better spacing
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          const Spacer(), // Consistent spacing between label and value
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      color: Colors.grey.withOpacity(0.3),
      thickness: 1,
      height: 2, // Adjusted to include a small gap with padding
    );
  }
}