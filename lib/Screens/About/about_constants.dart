/// Constants used in the About screen. This file contains the `githubApiUrl`, `codeUrl`, `webUrl`, `flutterUrl`, `tonyGnkUrl`, `aboutText`, `AboutTextSize`, `findFontSize`, and `updateLinkProvider` constants.
/// The `githubApiUrl` constant contains the GitHub API URL.
/// The `codeUrl` constant contains the URL for the GitHub repository.
/// The `webUrl` constant contains the URL for the web version of the app.
/// The `flutterUrl` constant contains the URL for the Flutter website.
/// The `tonyGnkUrl` constant contains the URL for the developer's GitHub profile.
/// The `aboutText` constant contains the text for the About screen.
/// The `AboutTextSize` enum contains the text sizes for the About screen.
/// The `findFontSize` function returns the font size for the provided text size.
/// The `updateLinkProvider` provider provides the latest update link. It is used in the `about_update_handler.dart` file.
library;

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

const aboutText = [
  'Node Odyssey',
  'Overview',
  'This Flutter app is designed to tackle problems through advanced algorithms, employing techniques like Breadth-First Search, Depth-First Search, Best First, and A*. It provides a versatile solution by taking a starting value, a target value, and allowing users to select the algorithm that best suits their needs.',
  'Key Features',
  '-Algorithm Selection: Choose from a range of algorithms, including Breadth-First Search, Depth-First Search, Best First, and A*',
  '-Input Flexibility: Input a starting value and a target value, allowing for a customizable problem-solving experience',
  '-Allowed Calculations: Define the rules of the exploration with permitted calculations (+1, -1, *2, /2, ^2, square 2)',
  "-Visual Progress: The GUI visually illustrates the algorithm's progress, enhancing user understanding",
];

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
      path: 'TonyGnk/algorithms/releases/latest',
    ));
