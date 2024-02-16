import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../about_constants.dart';
import 'about_actions_row.dart';

actionsRow(String version) => Consumer(
      builder: (context, ref, _) {
        final updateLink = ref.watch(updateLinkProvider);
        return SizedBox(
          height: 40,
          child: Row(
            children: [
              profileAction,
              flutterAction,
              updateAction(ref, version, updateLink),
            ],
          ),
        );
      },
    );
