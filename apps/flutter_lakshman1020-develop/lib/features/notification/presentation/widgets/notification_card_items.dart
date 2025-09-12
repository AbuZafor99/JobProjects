import 'package:flutter/material.dart';

class NotificationCardItems extends StatelessWidget {
  final String imagePath; 
  final String title;     

  const NotificationCardItems({
    super.key,
    required this.imagePath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          imagePath,
          height: 20,  // increased size a bit for visibility
          width: 20,
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xff303133),
          ),
        ),
      ],
    );
  }
}
