import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../global_variables.dart';

imageQr() => SizedBox(
      width: 500,
      child: Image.asset(
        filterQuality: FilterQuality.high,
        'assets/images/qrCodeT.png',
      ),
    );

class Basket extends ConsumerStatefulWidget {
  const Basket({
    required this.title,
    required this.icon,
    required this.onTap,
    super.key,
  });

  //Label
  final String title;

  //Icon of the button
  final IconData icon;

  final void Function() onTap;

  @override
  ConsumerState<Basket> createState() => _BasketState();
}

class _BasketState extends ConsumerState<Basket> {
  int elev = 4;
  Color color = Colors.white.withOpacity(0.1);
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
                elev = 4;
                hover = false;
                color = Colors.white.withOpacity(0.1);
              });
            },
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: widget.onTap,
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
            color: color,
            borderRadius: BorderRadius.circular(cornerSize),
          ),
          padding: const EdgeInsets.all(15),
          clipBehavior: Clip.antiAlias,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                widget.icon,
                size: 47,
                color: Theme.of(context).colorScheme.primary,
              ),
              Text(
                textAlign: TextAlign.center,
                widget.title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      );
}
