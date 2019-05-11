An API Wrapper for the [Wikimedia API](https://www.mediawiki.org/wiki/API:Main_page)

Created by [Benjamin Whitehead](www.linkedin.com/in/benjamin-whitehead-100)

[![pub package](https://img.shields.io/pub/v/http.svg)](https://pub.dartlang.org/packages/http)

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

## Getting Started
To get started, simply add dartpedia to  `pubspec.yaml`:
```yaml
dependencies:
  dartpedia: ^1.0.0
``` 

## Using
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
```dart
import 'package:dartpedia/dartpedia.dart' as wiki;

var wikipediaPage = await wiki.page('Dart (programming language)');
print(wikipediaPage.summary());

var url = wikipediaPage.url;
var title = wikipediaPage.title;

```

## Examples
For more examples, see 

