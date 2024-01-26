import 'package:flutter/material.dart';
import '../../Theme Services/ui_handler.dart';

class AdaptFilledButton extends StatelessWidget {
  /// A filled button widget that adapts to the current UI theme.
  ///
  /// It selects between two different implementations of a filled button based on the current UI theme. It uses the [uiSelector] function from the `ui_handler.dart` module to determine which implementation to use.
  const AdaptFilledButton({
    required this.onPressed,
    required this.label,
    this.icon,
    super.key,
  });

  /// The callback that is called when the button is pressed.
  final VoidCallback onPressed;

  /// The text that is displayed on the button.
  final String label;

  /// The icon that is displayed on the button.
  final IconData? icon;

  @override
  Widget build(BuildContext context) => uiSelector(
        oneUiFilledButton(
          context,
          onPressed,
          label,
          icon,
        ),
        materialFilledButton(
          context,
          onPressed,
          label,
          icon,
        ),
      );
}

Widget oneUiFilledButton(BuildContext context, void Function()? onPressed,
        String label, IconData? icon) =>
    icon != null
        ? FilledButton.icon(
            onPressed: onPressed,
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
              ),
            ),
            label: Text(
              label,
            ),
            icon: Icon(icon),
          )
        : FilledButton(
            onPressed: onPressed,
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
              ),
            ),
            child: Text(
              label,
            ),
          );

Widget materialFilledButton(BuildContext context, void Function()? onPressed,
        String label, IconData? icon) =>
    icon != null
        ? FilledButton.icon(
            onPressed: onPressed,
            label: Text(label),
            icon: Icon(icon),
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(1),
            ),
          )
        : FilledButton(
            onPressed: onPressed,
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(1),
            ),
            child: Text(label),
          );
