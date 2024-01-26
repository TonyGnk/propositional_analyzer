import 'package:flutter/material.dart';

class RoutedScreen extends StatelessWidget {
  /// A set of widgets that make up the screen.
  ///
  /// Each screen has a name and a outlined icon to display in the navigation bar/rail, essentially a not outlined icon when is selected.

  const RoutedScreen({
    required this.mainChild,
    required this.icon,
    this.labelRoute,
    super.key,
    this.filledIcon = Icons.error,
    this.label = '',
    this.noMargin = false,
  });

  /// Label in the navigation bar/rail and URL path
  final String label;

  /// The URL path of the screen
  final String? labelRoute;

  /// The icon to display in the navigation bar/rail when the screen is selected
  final IconData filledIcon;

  /// The icon to display in the navigation bar/rail
  final IconData icon;

  /// The main widget to display the content of the screen
  final Widget mainChild;

  final bool noMargin;

  @override
  Widget build(BuildContext context) => col(context);

  Column col(BuildContext context) => Column(
        children: [
          Expanded(child: mainChild),
        ],
      );

  Widget buildSmall(BuildContext context, double width, double height) =>
      Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(16),
            color: Theme.of(context).colorScheme.background),
        clipBehavior: Clip.antiAlias,
        padding: const EdgeInsets.all(3),
        width: width,
        height: height,
        child: Column(
          children: [
            const SizedBox(height: 10),

            mainChild,
            // ),
          ],
        ),
      );

  String get getLabel => label;
  String get getLabelWithSlash => labelRoute ?? '/$label';
  IconData get getFilledIcon => filledIcon;
  IconData get getIcon => icon;
  Widget get getMainChild => mainChild;
}
