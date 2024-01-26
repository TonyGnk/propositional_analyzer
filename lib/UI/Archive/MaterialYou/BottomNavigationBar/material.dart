import 'package:flutter/material.dart';

class MaterialNavBar extends StatelessWidget {
  const MaterialNavBar({
    required this.currentIndex,
    required this.onTap,
    required this.labels,
    required this.icons,
    required this.iconsOutlined,
    super.key,
  });

  final int currentIndex;
  final void Function(int)? onTap;
  final List<String> labels;
  final List<IconData> icons;
  final List<IconData> iconsOutlined;

  @override
  Widget build(BuildContext context) => NavigationBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        animationDuration: const Duration(milliseconds: 500),
        destinations: <Widget>[
          NavigationDestination(
            icon: Icon(iconsOutlined[0]),
            selectedIcon: Icon(icons[0]),
            label: labels[0],
            tooltip: getTooltip(labels[0]),
          ),
          //If label not null and icon not null then display the next icon
          if (labels[1] != '')
            NavigationDestination(
              icon: Icon(iconsOutlined[1]),
              selectedIcon: Icon(icons[1]),
              label: labels[1],
              tooltip: getTooltip(labels[1]),
            ),
          if (labels[1] != '')
            NavigationDestination(
              icon: Icon(iconsOutlined[1]),
              selectedIcon: Icon(icons[1]),
              label: labels[1],
              tooltip: getTooltip(labels[1]),
            ),
        ],
        onDestinationSelected: onTap,
        selectedIndex: currentIndex,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      );

  String getTooltip(String label) => 'Navigate to $label';
}
