An API Wrapper for the [MediaWiki API](https://www.mediawiki.org/wiki/API:Main_page)

Created by [Benjamin Whitehead](https://www.linkedin.com/in/benjamin-whitehead-100)

[![pub package](https://img.shields.io/pub/v/http.svg)](https://pub.dartlang.org/packages/http)

This is an early implementation of the MediaWiki API in Dart. Note, there are still some issues with this API that will be worked on in the coming months. Some of these issues include: unclean data and over use of dynamic types.

## Getting Started
To get started, simply add dartpedia to  `pubspec.yaml`:
```yaml
dependencies:
  dartpedia: ^1.0.0
``` 

## Using
To use dartpedia, first start by importing the package.
```dart
import 'package:dartpedia/dartpedia.dart' as wiki;
```
Next, create a new WikipediaPage object with the `wiki.page(topic)` function.
```dart
var wikipediaPage = await wiki.page('Dart (programming language)');
```
Use the `.summary()` function to print a summary of the page.
```dart
print(wikipediaPage.summary());
```
To get the individual components of a page, use the following functions
```dart
var url = wikipediaPage.url;
var title = wikipediaPage.title;
var links = wikipediaPage.links;
var content = wikipediaPage.content;
```

## Examples
For more examples, see the examples folder.

## Future Plans:
1. Rewrite WikipediaAPI class, get rid of all dynamics for more type safety (hopefully).
    1. Also continue to clean up data given by API 
2. Implement Topic Search:
    * Search for a title or text.
    * Search for wiki pages near a location.
    * Prefix Search Functionality
