import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'Left Side/about_actions_row.dart';

const String githubApiUrl =
    'https://api.github.com/repos/TonyGnk/propositional_analyzer/releases/latest';

//Urls
final codeUrl = Uri(
  scheme: 'https',
  host: 'github.com',
  path: 'TonyGnk/propositional_analyzer',
);

final webUrl = Uri(
  scheme: 'https',
  host: 'tonygnk.github.io',
  path: 'propositional_analyzer',
);

final flutterUrl = Uri(
  scheme: 'https',
  host: 'flutter.dev',
);

final tonyGnkUrl = Uri(
  scheme: 'https',
  host: 'github.com',
  path: 'TonyGnk',
);

enum AboutTextSize { small, medium, large }

final updateLinkProvider = StateProvider<String>((ref) =>
    'https://github.com/TonyGnk/propositional_analyzer/releases/latest');

actionsRow(String version) => Consumer(
      builder: (context, ref, _) {
        final updateLink = ref.watch(updateLinkProvider);
        return SizedBox(
          height: 40,
          child: Row(
            children: [
              updateAction(ref, version, updateLink),
            ],
          ),
        );
      },
    );
