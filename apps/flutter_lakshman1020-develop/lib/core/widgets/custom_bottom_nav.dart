import 'package:flutter/material.dart';
class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final List<NavItemData> items;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        color: Color(0xFFF8F6F0),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            items.length,
            (index) => _buildNavItem(
              index: index,
              item: items[index],
              isSelected: currentIndex == index,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required NavItemData item,
    required bool isSelected,
  }) {
    final icon = isSelected && item.selectedIcon != null
        ? item.selectedIcon
        : item.icon;

    if (isSelected) {
      return GestureDetector(
        onTap: () {
          onTap(index);
          item.onPressed?.call();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: Colors.blue, size: 20),
              if (item.label != null) ...[
                const SizedBox(width: 6),
                Text(
                  item.label!,
                  style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ],
            ],
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        onTap(index);
        item.onPressed?.call();
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Icon(icon, color: Colors.blue, size: 24),
      ),
    );
  }
}

class NavItemData {
  final IconData icon;
  final IconData? selectedIcon;
  final String? label;
  final VoidCallback? onPressed;

  NavItemData({
    required this.icon,
    this.selectedIcon,
    this.label,
    this.onPressed,
  });
}
