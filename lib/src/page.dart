import 'dart:async';
import 'package:dio/dio.dart';

// Exception used by Page to determine if a Wikipedia Page exists or not
class MissingTitleException implements Exception {
  String cause;
  MissingTitleException(String cause);
}

class WikipediaPage {
  // Title of the Page, a link friendly version of the title, and the content of the page
  String _title, _titleLink, _content;
  // The Wikipedia Page Identifier
  int _pageId;
  // A list of links found on the WikipediaPage
  dynamic _links;

  // The base URL for the Wikipedia API
  static const String URL = "https://en.wikipedia.org/w/api.php";

  WikipediaPage({String title, String content, int pageId, dynamic links}) {
    this._title = title;
    this._content = content;
    this._pageId = pageId;
    this._links = links;
    // Replaces the spaces in the title with underscores via Wikipedia Syntax
    if (title != null)
      this._titleLink = title.replaceAll(' ', '_');
  }

  /// Return's a summary of the Wikipedia Article represented by this class.
  Object summary() {
    var buffer = StringBuffer();
    buffer.write('TITLE:  ${this._title}\n');
    buffer.write('URL:  http://en.wikipedia.org/wiki/$_titleLink\n');
    buffer.write('ID:  ${this._pageId}\n');
    buffer.write('LINKS:  ${this._links}\n');
    buffer.write('PAGE CONTENT:  ${this._content}\n');
    return buffer.toString();
  }

  /// Summarize's the content of the Wikipedia Page up to length characters long
  Object summarizeContentUpTo(int length) {
    return this._content.substring(0, length);
  }

  // Summarize's the content of the Wikipedia Page from start to end character
  Object summarizeContentFromTo(int start, int end) {
    return this._content.substring(start, end);
  }

  String get title => _title;
  String get content => _content;
  String get url => 'http://en.wikipedia.org/wiki/$_titleLink';
  int get pageId => _pageId;
  dynamic get links => _links;
}

/// Parses a Wikipedia page given a specific topic, get's a response and checks for errors.
Future parseWikipediaPage(String topic, Map<String, dynamic> params) async {
  Response response = await Dio()
      .get("https://en.wikipedia.org/w/api.php", queryParameters: params);
  var pageData = response.data;
  if (pageData['error'] != null) {
    final errorCode = pageData['error']['code'];
    if (errorCode == 'missingtitle')
      throw MissingTitleException('Title not found');
  } else
    return pageData;
}

/// The data recieved by the Wikipedia API is messy, this get's rid of unessential data
void cleanData(dynamic pageData) {
  pageData['parse'].remove('langlinks');
  pageData['parse'].remove('categories');
  pageData['parse'].remove('templates');
  pageData['parse'].remove('images');
  pageData['parse'].remove('externallinks');
  pageData['parse'].remove('sections');
  pageData['parse'].remove('parsewarnings');
  pageData['parse'].remove('iwlinks');
  pageData['parse'].remove('properties');
  pageData['parse']['text']['*'] = pageData['parse']['text']['*']
      .replaceAll(RegExp("<[^>]*>"), "")
      .replaceAll(RegExp("[&][#][0-9]{2}"), "");
}

/// Create's a list of all the links from the Wikipedia Page.
dynamic getLinks(List<dynamic> linkData) {
  List<String> list = List<String>();
  linkData.forEach((e) => list.add(e['*'] as String));
  return list;
}

/// Wraps a WikipediaPage object inside of a Future so it can be used.
Future page(String topic) async {
  var pageData = await parseWikipediaPage(
      topic, {'action': 'parse', 'page': topic, 'format': 'json'});
  cleanData(pageData);
  dynamic pageLinks = getLinks(pageData['parse']['links']);
  WikipediaPage page = WikipediaPage(
      title: pageData['parse']['title'],
      content: pageData['parse']['text']['*'],
      pageId: pageData['parse']['pageid'],
      links: pageLinks);
  return page;
}
