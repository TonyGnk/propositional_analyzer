import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../template.dart';

class CustomPopupMenu extends StatelessWidget {
  const CustomPopupMenu({
    required this.menuItemText,
    required this.menuItemFunctions,
    required this.context,
    super.key,
  });
  final List<String> menuItemText;
  final List<Function> menuItemFunctions;

  final BuildContext context;

  @override
  Widget build(BuildContext context) =>
      Consumer(builder: (_, WidgetRef ref, __) {
        bool ui = ref.watch(OneUi);
        return PopupMenuButton<String>(
          shape: RoundedRectangleBorder(
            borderRadius:
                ui ? BorderRadius.circular(25.0) : BorderRadius.circular(10.0),
            side: ui
                ? const BorderSide(color: Colors.white, width: 0.1)
                : const BorderSide(color: Colors.transparent, width: 0.1),
          ),
          clipBehavior: Clip.antiAlias,
          constraints: BoxConstraints(
            minWidth: ui ? 260 : 180,
            maxWidth: ui ? 260 : 180,
          ),
          itemBuilder: (BuildContext context) {
            final List<PopupMenuEntry<String>> items = [];

            for (int i = 0; i < 6; i++) {
              if (menuItemText[i].isNotEmpty) {
                items.add(
                  PopupMenuItem<String>(
                    value: 'Option${i + 1}',
                    padding: ui
                        ? const EdgeInsets.fromLTRB(30, 0, 30, 0)
                        : const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    onTap: () => menuItemFunctions[i](),
                    child: Text(menuItemText[i]),
                  ),
                );
              }
            }

            return items;
          },
          onSelected: (String value) {
            // Handle option selection
          },
        );
      });
}
