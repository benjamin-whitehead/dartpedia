An API Wrapper for the [MediaWiki API](https://www.mediawiki.org/wiki/API:Main_page)

Created by [Benjamin Whitehead](https://www.linkedin.com/in/bmw1042)

[![pub package](https://img.shields.io/pub/v/dartpedia.svg)](https://pub.dartlang.org/packages/dartpedia)
[![Build Status](https://travis-ci.com/benjamin-whitehead/dartpedia.svg?branch=master)](https://travis-ci.com/benjamin-whitehead/dartpedia)

This is an early implementation of the MediaWiki API in Dart. Note, there are still some issues with this API that will be worked on in the coming months. Some of these issues include: unclean data and over use of dynamic types.

NOTE: This is the development branch, for more stable, please see master

## Getting Started
To get started, simply add dartpedia to  `pubspec.yaml`:
```yaml
dependencies:
  dartpedia: ^1.6.6
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
To search for possible topics for a phrase, use the `.search(topic)` function
```dart
var relatedTopics = await wiki.search("Dart");
print(relatedTopics);
```
## Examples:
More examples can be found in the Examples folder