import 'package:flutter/material.dart';
import '../../Theme Services/ui_handler.dart';

class AdaptElevatedButton extends StatelessWidget {
  /// A elevated button widget that adapts to the current UI theme.
  ///
  /// It selects between two different implementations of a elevated button based on the current UI theme. It uses the [uiSelector] function from the `ui_handler.dart` module to determine which implementation to use.
  const AdaptElevatedButton({
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
        oneUiElevatedButton(
          context,
          onPressed,
          label,
          icon,
        ),
        materialElevatedButton(
          context,
          onPressed,
          label,
          icon,
        ),
      );
}

Widget oneUiElevatedButton(BuildContext context, void Function()? onPressed,
        String label, IconData? icon) =>
    icon != null
        ? ElevatedButton.icon(
            onPressed: onPressed,
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(1),
              backgroundColor: MaterialStateProperty.all(
                Theme.of(context).colorScheme.surfaceTint,
              ),
              overlayColor: MaterialStateProperty.all(
                Theme.of(context)
                    .buttonTheme
                    .colorScheme
                    ?.onPrimary
                    .withOpacity(0.1),
              ),
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
              ),
            ),
            label: Text(
              label,
              style: TextStyle(
                color: Theme.of(context).buttonTheme.colorScheme?.onPrimary,
              ),
            ),
            icon: Icon(icon),
          )
        : ElevatedButton(
            onPressed: onPressed,
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(1),
              backgroundColor: MaterialStateProperty.all(
                Theme.of(context).colorScheme.surfaceTint,
              ),
              overlayColor: MaterialStateProperty.all(
                Theme.of(context)
                    .buttonTheme
                    .colorScheme
                    ?.onPrimary
                    .withOpacity(0.1),
              ),
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
              ),
            ),
            child: Text(
              label,
              style: TextStyle(
                color: Theme.of(context).buttonTheme.colorScheme?.onPrimary,
              ),
            ),
          );

Widget materialElevatedButton(BuildContext context, void Function()? onPressed,
        String label, IconData? icon) =>
    icon != null
        ? ElevatedButton.icon(
            onPressed: onPressed,
            label: Text(label),
            icon: Icon(icon),
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(1),
            ),
          )
        : ElevatedButton(
            onPressed: onPressed,
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(1),
            ),
            child: Text(label),
          );
