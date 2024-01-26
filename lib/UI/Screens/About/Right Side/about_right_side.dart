import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../Services/constants.dart';
import 'about_down_of_qr.dart';

/// Builds a custom column for the right side of the about screen.
/// The column contains an image container and a QR code container.
/// The image container displays a high-quality image asset.
/// The QR code container displays a column of QR codes.
customAboutRightColumn() => Column(
      children: [
        aboutContainer(
          Image.asset(
            filterQuality: FilterQuality.high,
            'assets/images/qrCodeT.png',
          ),
        ),
        const SizedBox(height: 20),
        aboutContainer(qrCodeColumn()),
      ],
    );

/// Builds a container with a specified child widget.
/// The container has a fixed width of 250 and is decorated with a shadow color, border, and border radius.
/// The child widget is clipped to the container's boundaries.
aboutContainer(Widget child) => Consumer(
      builder: (context, ref, _) => Container(
        width: 250,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Theme.of(context).shadowColor.withOpacity(0.5),
          border: Border.all(
            color: Colors.grey.withOpacity(0.3),
            width: 1.5,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(cornerSize),
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: child,
      ),
    );
