import 'package:flutter_riverpod/flutter_riverpod.dart';

const String githubApiUrl =
    'https://api.github.com/repos/TonyGnk/algorithms/releases/latest';

//Urls
final codeUrl = Uri(
  scheme: 'https',
  host: 'github.com',
  path: 'TonyGnk/Node-Odyssey',
);

final webUrl = Uri(
  scheme: 'https',
  host: 'tonygnk.github.io',
  path: 'Node-Odyssey',
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

double findFontSize(AboutTextSize type) {
  switch (type) {
    case AboutTextSize.small:
      return 15;
    case AboutTextSize.medium:
      return 22;
    case AboutTextSize.large:
      return 27;
    default:
      return 22;
  }
}

final updateLinkProvider = StateProvider<Uri>((ref) => Uri(
      scheme: 'https',
      host: 'github.com',
      path: 'TonyGnk/propositional_analyzer/releases/latest',
    ));
