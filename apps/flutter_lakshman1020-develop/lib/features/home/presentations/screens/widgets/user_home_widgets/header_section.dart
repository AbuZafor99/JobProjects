import 'package:flutter/material.dart';
import 'package:flutter_lakshman1020/core/constants/app_colors.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          const SizedBox(width: 12),
          // Welcome text
          Container(
            padding: EdgeInsets.all(2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Welcome back, Daniel",
                  style: TextStyle(
                    color: TColors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "@daniel001",
                  style: TextStyle(color: TColors.white, fontSize: 12),
                ),
              ],
            ),
          ),
          Spacer(),
          // Notification icon
          IconButton(
            icon: const Image(
              image: AssetImage("assets/images/notification.png"),
              height: 32,
              width: 32,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
