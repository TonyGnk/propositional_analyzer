import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../global_variables.dart';

imageQr() => Consumer(
      builder: (context, ref, _) => SizedBox(
        width: 500,
        child: Theme.of(context).brightness == Brightness.dark
            ? Image.asset(
                filterQuality: FilterQuality.high,
                'assets/images/qrCodeD.png',
              )
            : Image.asset(
                filterQuality: FilterQuality.high,
                'assets/images/qrCodeL.png',
              ),
      ),
    );

class Basket extends ConsumerStatefulWidget {
  const Basket({
    required this.title,
    required this.icon,
    this.onTap,
    this.updateLink = '',
    this.onTapCheck,
    super.key,
  });

  //Label
  final String title;

  //Icon of the button
  final IconData icon;

  final void Function()? onTap;
  final void Function(String updateLink)? onTapCheck;

  final String updateLink;

  @override
  ConsumerState<Basket> createState() => _BasketState();
}

class _BasketState extends ConsumerState<Basket> {
  int elev = 3;
  bool hover = false;

  @override
  Widget build(BuildContext context) => Expanded(
        child: Consumer(
          builder: (context, ref, _) => MouseRegion(
            onEnter: (event) {
              setState(() {
                elev = 1;
                hover = true;
              });
            },
            onExit: (event) {
              setState(() {
                elev = 3;
                hover = false;
              });
            },
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: widget.onTap ??
                  () async => widget.onTapCheck!(widget.updateLink),
              child: card(),
            ),
          ),
        ),
      );

  card() => Card(
        elevation: elev.toDouble(),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(cornerSize),
            border: (Theme.of(context).brightness == Brightness.dark)
                ? Border.all(
                    color: Theme.of(context)
                        .menuButtonTheme
                        .style!
                        .foregroundColor!
                        .resolve({})!)
                : null,
          ),
          padding: const EdgeInsets.all(19),
          clipBehavior: Clip.antiAlias,
          child: AnimatedScale(
            duration: const Duration(milliseconds: 200),
            scale: hover ? 0.94 : 1.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  widget.icon,
                  size: 44,
                  color: Theme.of(context).colorScheme.primary,
                ),
                Text(
                  textAlign: TextAlign.center,
                  widget.title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

class BasketQr extends ConsumerStatefulWidget {
  const BasketQr({
    required this.onTap,
    super.key,
  });

  final void Function() onTap;

  @override
  ConsumerState<BasketQr> createState() => _BasketQrState();
}

class _BasketQrState extends ConsumerState<BasketQr> {
  int elev = 3;
  bool hover = false;

  @override
  Widget build(BuildContext context) => Consumer(
        builder: (context, ref, _) => MouseRegion(
          onEnter: (event) {
            setState(() {
              elev = 1;
              hover = true;
            });
          },
          onExit: (event) {
            setState(() {
              elev = 3;
              hover = false;
            });
          },
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: widget.onTap,
            child: card(),
          ),
        ),
      );

  card() => Card(
        elevation: elev.toDouble(),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(cornerSize),
            border: (Theme.of(context).brightness == Brightness.dark)
                ? Border.all(
                    color: Theme.of(context)
                        .menuButtonTheme
                        .style!
                        .foregroundColor!
                        .resolve({})!)
                : null,
          ),
          clipBehavior: Clip.antiAlias,
          child: AnimatedScale(
            duration: const Duration(milliseconds: 250),
            scale: hover ? 0.97 : 1.0,
            child: Consumer(
              builder: (context, ref, _) => SizedBox(
                width: 500,
                child: Theme.of(context).brightness == Brightness.dark
                    ? Image.asset(
                        filterQuality: FilterQuality.high,
                        'assets/images/qrCodeD.png',
                      )
                    : Image.asset(
                        filterQuality: FilterQuality.high,
                        'assets/images/qrCodeL.png',
                      ),
              ),
            ),
          ),
        ),
      );
}
