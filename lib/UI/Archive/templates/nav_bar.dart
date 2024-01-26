import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../MaterialYou/BottomNavigationBar/material.dart';
import '../../Theme Services/ui_handler.dart';
import '../OneUI/BottomNavigationBar/one_ui.dart';
import '../OneUI/BottomNavigationBar/onenavitem.dart';

class BottomNavBar {
  BottomNavBar(
      {required this.index,
      required this.onTap,
      required this.labels,
      required this.icons,
      required this.iconsOutlined});

  final int index;
  final ValueChanged<int>? onTap;
  final List<String> labels;
  final List<IconData> icons;
  final List<IconData> iconsOutlined;

  Widget build(int currentPageIndex) =>
      Consumer(builder: (_, WidgetRef ref, __) {
        final selectedType = ref.watch(selectedStateProviderType);

        return selectedType == StateProviderType.oneUi
            ? OneUIBottomNavigationBar(
                currentIndex: index,
                onTap: onTap,
                items: [
                  OneUIBottomNavigationBarItem(
                    label: labels[0],
                  ),
                  OneUIBottomNavigationBarItem(
                    label: labels[1],
                  ),
                  OneUIBottomNavigationBarItem(
                    label: labels[1],
                  ),
                ],
              )
            : MaterialNavBar(
                currentIndex: index,
                onTap: onTap,
                labels: labels,
                icons: icons,
                iconsOutlined: iconsOutlined,
              );
      });
}
